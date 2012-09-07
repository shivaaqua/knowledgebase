class Snippet < ActiveRecord::Base
  attr_accessible :title, :snippet_type_id, :description, :snippet_detail_attributes
  
  #associations
  belongs_to :snippet_type
  has_one    :snippet_detail, :dependent => :destroy
  accepts_nested_attributes_for :snippet_detail, :allow_destroy => true
        
  #callbacks
  before_validation :trim_attributes
  
  #validations  
  validates :title,           :presence   => true,
                              :length     => {:maximum => 100, :if => :title_present? },
                              :uniqueness => {:case_sensitive => false, 
                                              :scope => :snippet_type_id,
                                              :if => :title_present? }
                              
  validates :snippet_type_id, :presence     => true,
                              :numericality => {:only_integer => true, :greater_than => 0 }
 
  validates :description,     :presence => true,
                              :length   => {:maximum => 1000, :if => :description_present? }


  
  #scopes
  scope :recent_four_items, order("snippets.created_at DESC").limit(4)
  
  def self.search(*attrs)
    arel = self.includes(:snippet_detail).order("created_at DESC")
    if attrs[0] == 'category'
      arel = arel.where(:snippet_type_id => attrs[1].strip)
    else
      value = attrs[1].present? ? "%" + attrs[1].strip + "%" : nil
      arel = arel.where("title LIKE ? or description LIKE ? ", value, value) if value.present?
    end
    arel = arel.page(attrs[2]) if attrs[2].present?
    arel
  end
                   
  def posted_date
    created_at.try(:strftime, "%b %d, %Y")
  end

  def video_url
    snippet_detail.video.url
  end

  def video_present?
    video_url != '/videos/original/missing.png'
  end
  
  private
  def title_present?
    title.present?
  end
  
  def description_present?
    description.present?
  end
  
  def snippet_type_has_maxlength_ten?
    snippet_type_id.to_s.size <= 10
  end
  
  def trim_attributes
    attributes.each do |attr, value|
      self[attr] = value.try(:strip) if value.respond_to?(:strip)
    end
  end
  
 
                              
end
