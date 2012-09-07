class SnippetDetail < ActiveRecord::Base
  attr_accessible :detail, :photo, :video, :snippet_id
  
  #associations
  belongs_to :snippet
  has_attached_file :photo, :styles => { :thumb => "175x100" }
  has_attached_file :video
  
  #callbacks
  before_validation :trim_attributes

  #validations  
  validates :snippet_id,       :numericality => {:only_integer => true, 
                                                 :greater_than => 0, :if => :snippet_id_present? }
                                    
  validates :detail,           :presence => true
  
  validates_attachment :photo, :content_type => {
                             :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']},
                               :size => { :less_than => 2.megabytes }
                               
  validates_attachment :video, :content_type => {:content_type => ['video/mp4','video/ogg'] ,
                               :message => "Sorry, right now we only support MP4 video" },
                               :size => { :less_than => 150.megabytes }


  #private methods
  def trim_attributes
    attributes.each do |attr, value|
      self[attr] = value.try(:strip) if value.respond_to?(:strip)
    end
  end
  
   def video_file?
    video.content_type =~ %r(video)
  end

  def image_file?
    photo.content_type =~ %r(image)
  end

  def snippet_id_present?
    snippet_id.present?
  end

end
