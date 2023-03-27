class AddColumnTOeuips < ActiveRecord::Migration[6.1]
  def change
    add_column:equipment_tables,:contact_no,:integer
  end
end
