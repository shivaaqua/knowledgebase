require 'spec_helper'

describe SnippetType do

  before do
    FactoryGirl.create(:snippet_type)
  end

  context "Validations" do
    it { should validate_presence_of(:name)                    }
    it { should validate_presence_of(:description)             }
    it { should ensure_length_of(:name).is_at_most(20)         }
    it { should ensure_length_of(:description).is_at_most(100) }
  end
    
  context "Mass Assignments"  do
    it { should allow_mass_assignment_of(:name)            }
    it { should allow_mass_assignment_of(:description)     }
    it { should_not allow_mass_assignment_of(:created_at)  }
    it { should_not allow_mass_assignment_of(:updated_at)  }
  end
  
  context "Associations" do
    it { should have_many(:snippets) }
  end
  
  context "Callbacks" do
    it { should trim(:name)        }
    it { should trim(:description) }
  end
end
