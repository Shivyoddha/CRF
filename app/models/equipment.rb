class Equipment < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :titles
  has_many :contents
  has_many :briefs
end
