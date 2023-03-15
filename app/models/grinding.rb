class Grinding < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :grit
  serialize :diamond
  serialize :suspension
end
