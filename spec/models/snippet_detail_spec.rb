require 'spec_helper'

describe SnippetDetail do

  before do
    FactoryGirl.create(:snippet_detail)
  end

  context "Validations" do
    it { should validate_presence_of(:snippet_id)  }
    it { should validate_presence_of(:detail)      }
  end
    
  context "Mass Assignments"  do
    it { should allow_mass_assignment_of(:snippet_id)      }
    it { should allow_mass_assignment_of(:detail)          }
    it { should_not allow_mass_assignment_of(:created_at)  }
    it { should_not allow_mass_assignment_of(:updated_at)  }
  end
  
  context "Associations" do
    it { should belong_to(:snippet) }
  end
  
  context "Callbacks" do
    it { should trim(:detail) }
  end
  
  context "Paperclip" do
    it { should validate_attachment_content_type(:photo).
                allowing('image/png', 'image/jpeg', 'image/jpg', 'image/gif').
                rejecting('text/plain', 'text/xml', 'text/html') }
                
    it { should validate_attachment_size(:photo).
                less_than(2.megabytes) }
                
    it { should validate_attachment_content_type(:video).
                allowing('video/mp4','video/ogg').
                rejecting('text/plain', 'text/xml', 'text/html', 'text/gif') }
                
    it { should validate_attachment_size(:video).
                less_than(150.megabytes) }
  end

end
