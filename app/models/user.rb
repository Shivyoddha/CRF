class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 has_one_attached :file
has_many :xrds
has_many :hr_fesem_cs
has_many :hr_fesem_js
has_many:three_d_non_contacts
has_many:raman_microscope
has_many:uv_vis_nir
has_many:tga_fttr
has_many:atomic_force_microscope
has_many:cell_imaging
end
