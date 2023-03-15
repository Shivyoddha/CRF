class FtNm < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :measurement1
  serialize :measurement2
  serialize :measurement3
  serialize :measurement4
  serialize :measurement5
  serialize :hazardmethod
end
