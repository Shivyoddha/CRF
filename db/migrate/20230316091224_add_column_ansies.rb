class AddColumnAnsies < ActiveRecord::Migration[6.1]
  def change
    remove_column:ansies,:slotdate
    add_column:ansies,:customstart,:date
    add_column:ansies,:customend,:date
    
  end
end
