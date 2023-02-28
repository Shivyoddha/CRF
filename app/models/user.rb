class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :file
has_many :xrds
has_many :hr_fesem_cs
has_many :hr_fesem_js
has_many :icp_ms
has_many :advance_molecular_rheometers
has_many :ion_chromotography
has_many :tribometers
has_many :glows
has_many :ball_mailings
has_many :multi_impact_testers
has_many :frictions
has_many :gaits
has_many :hrlcms
has_many :grindings
has_many :low_fatigues
end
