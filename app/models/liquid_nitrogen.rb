class LiquidNitrogen < ApplicationRecord
  belongs_to:user
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
end
