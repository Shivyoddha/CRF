class FtNm < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :measurement1
  serialize :measurement2
  serialize :measurement3
  serialize :measurement4
  serialize :measurement5
  serialize :hazardmethod
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
  after_create :update_equipment
  def update_equipment
    equipment_table = self.equipment_table # Find the specific AnotherTable record
    equipment_table.update(app_no: "CRF/FTNMR/#{self.id}")
  end
end
