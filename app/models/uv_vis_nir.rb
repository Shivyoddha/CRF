class UvVisNir < ApplicationRecord
    has_many_attached :references
    belongs_to:user
end
