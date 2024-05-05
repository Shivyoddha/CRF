class Training3 < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :training_list, optional: true
end
