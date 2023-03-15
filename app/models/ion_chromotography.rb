class IonChromotography < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :hazard_method
end
