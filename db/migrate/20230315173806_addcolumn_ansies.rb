class AddcolumnAnsies < ActiveRecord::Migration[6.1]
  def change
    remove_column:ansies ,:slotdate
    add_column:ansies,:startdate,:date
    add_column:ansies,:enddate,:date
  end
end
