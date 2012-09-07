class Comment < ActiveRecord::Base
  attr_accessible :comment, :question, :question_id, :user_id
end
