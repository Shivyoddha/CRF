class Grinding < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :grit
  serialize :diamond
  serialize :suspension
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
  after_create :update_equipment
  def update_equipment
    equipment_table = self.equipment_table # Find the specific AnotherTable record
    equipment_table.update(app_no: "CRF/GRD/#{self.id}") 
  end
end
