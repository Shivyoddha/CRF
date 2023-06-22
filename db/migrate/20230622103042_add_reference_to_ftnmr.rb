class AddReferenceToFtnmr < ActiveRecord::Migration[6.1]
  def change
      add_reference :equipment_tables, :ft_nm, foreign_key: true
  end
end
