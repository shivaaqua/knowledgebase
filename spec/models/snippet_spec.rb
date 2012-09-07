require 'spec_helper'

describe Snippet do

  before do
    FactoryGirl.create(:snippet)
  end

  context "Validations" do
    it { should validate_presence_of(:title)                               }
    it { should validate_presence_of(:snippet_type_id)                     }
    it { should validate_presence_of(:description)                         }
    it { should validate_uniqueness_of(:title).
                  case_insensitive.
                  scoped_to(:snippet_type_id)                              }
                                               
    it { should validate_numericality_of(:snippet_type_id).only_integer    }
    it { should_not allow_value(0).for(:snippet_type_id)                   }
    it { should ensure_length_of(:title).is_at_most(100)                   }
    it { should ensure_length_of(:description).is_at_most(1000)            }
  end
   
  context "Mass Assignments"  do
    it { should allow_mass_assignment_of(:title)           }
    it { should allow_mass_assignment_of(:snippet_type_id) }
    it { should allow_mass_assignment_of(:description)     }
    it { should allow_mass_assignment_of(:snippet_detail_attributes) }
    it { should_not allow_mass_assignment_of(:created_at)  }
    it { should_not allow_mass_assignment_of(:updated_at)  }
  end
  
  context "Associations" do
    it { should belong_to(:snippet_type)                      }
    it { should have_one(:snippet_detail).dependent(:destroy) }
    it { should accept_nested_attributes_for(:snippet_detail) }
  end
  
  context "Callbacks" do
    it { should trim(:title)           }
    it { should trim(:snippet_type_id) }
    it { should trim(:description)     }  
  end

end
