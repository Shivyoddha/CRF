class Title < ApplicationRecord
  belongs_to :equipment
  has_many :contents
  has_many :briefs

end
