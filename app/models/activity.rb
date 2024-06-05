class Activity < ApplicationRecord
    self.inheritance_column = :_type_disabled # Disable Single Table Inheritance for this model
end
