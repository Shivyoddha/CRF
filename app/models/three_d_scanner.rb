class ThreeDScanner < ApplicationRecord
  has_many_attached :references
  belongs_to:user
  serialize :output_format
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
  after_create :update_equipment
  after_update :update_slotd
  after_create :file_name_search
  def update_equipment
    equipment_table = self.equipment_table # Find the specific AnotherTable record
    equipment_table.update(app_no: "CRF/TDS/#{self.id}")
  end
  def update_slotd
    equipment_table = self.equipment_table # Find the specific AnotherTable record
    equipment_table.update(slotd: self.slotdate)
  end



   def  file_name_search
     get_filenames_from_references(self.references)
   end


   def get_filenames_from_references(references)
  filenames = []

  references.each do |reference|
    file_path = ActiveStorage::Blob.service.path_for(reference.blob.key)
    filenames << File.basename(file_path)
    self.equipment_table.file_name =filenames
  end


end
end
