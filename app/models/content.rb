class Content < ApplicationRecord
  belongs_to :equipment
  belongs_to :title
  has_many :briefs
end
