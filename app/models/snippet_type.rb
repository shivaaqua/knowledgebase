class SnippetType < ActiveRecord::Base
  attr_accessible :description, :name
  
  #associations
  has_many :snippets
  
  #callbacks
  before_validation :trim_attributes
  
  #validations
  validates :name,        :presence   => true, 
                          :length     => {:maximum => 20, :if => :name_present? },
                          :uniqueness => {:case_sensitive => false }
                          
  validates :description, :presence => true,
                          :length   => {:maximum => 100, :if => :description_present? }
  
  def name_present?
    name.present?  
  end
  
  def description_present?
    description.present?  
  end
  
  def trim_attributes
    attributes.each do |attr, value|
      self[attr] = value.try(:strip) if value.respond_to?(:strip)
    end
  end
  
end
