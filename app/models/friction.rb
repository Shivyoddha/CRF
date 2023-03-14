class Friction < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :material
end
