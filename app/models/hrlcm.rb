class Hrlcm < ApplicationRecord
  has_many_attached :references
  belongs_to :user
  serialize :hazard_method
  has_one :equipment_table, :dependent => :destroy
  accepts_nested_attributes_for :equipment_table
  serialize :testing_required
end
