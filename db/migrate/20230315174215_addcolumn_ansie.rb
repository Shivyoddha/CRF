class AddcolumnAnsie < ActiveRecord::Migration[6.1]
  def change
    add_column:ansies,:slotdate,:string 
  end
end
