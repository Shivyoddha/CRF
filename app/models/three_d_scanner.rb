class ThreeDScanner < ApplicationRecord
  has_many_attached :references
  belongs_to:user
  serialize :output_format
end
