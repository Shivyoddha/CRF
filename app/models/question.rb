class Question < ApplicationRecord
  belongs_to :equipment
  has_many :answers
end
