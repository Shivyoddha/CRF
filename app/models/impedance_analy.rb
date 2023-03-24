class ImpedanceAnaly < ApplicationRecord
  has_many_attached :references
  belongs_to:user
  serialize :measurement
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
end
