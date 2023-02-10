class Answer < ApplicationRecord
   belongs_to :question
   belongs_to :equipment
   belongs_to :user
end
