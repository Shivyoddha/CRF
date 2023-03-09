class EquipmentTable < ApplicationRecord
  belongs_to :xrd, optional: true
  belongs_to :hr_fesem_c, optional: true
  belongs_to :hr_fesem_j, optional: true
  belongs_to :three_d_non_contact, optional: true
  belongs_to :tga_fttr, optional: true
  belongs_to :electro_chemical, optional: true
  belongs_to :cell_imaging, optional: true
  belongs_to :bet, optional: true
  belongs_to :ball_mailing, optional: true
  belongs_to :atomic_force_microscope, optional: true
  belongs_to :advance_molecular_rheometer, optional: true

end
