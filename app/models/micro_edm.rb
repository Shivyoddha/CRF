class MicroEdm < ApplicationRecord
   has_many_attached :references
    belongs_to:user
    serialize :measuerment
end
