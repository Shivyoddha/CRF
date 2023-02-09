class Brief < ApplicationRecord
  belongs_to :equipment
  belongs_to :title
  belongs_to :content
end
