class Gait < ApplicationRecord
  has_many_attached :references
  has_many_attached :ethicals
  has_many_attached :prescrptions
  has_many_attached :clinicals
  belongs_to :user
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
end
