class MicroEdm < ApplicationRecord
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
end
