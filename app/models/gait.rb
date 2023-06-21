class Gait < ApplicationRecord
  has_many_attached :references
  has_many_attached :ethicals
  has_many_attached :prescrptions
  has_many_attached :clinicals
  belongs_to :user
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
  serialize :output_format
  after_create :update_equipment
  def update_equipment
    equipment_table = self.equipment_table # Find the specific AnotherTable record
    equipment_table.update(app_no: "CRF/GT/#{self.id}") 
  end
end
