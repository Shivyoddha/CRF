class AddColumnToAdvance < ActiveRecord::Migration[6.1]
  def change
    add_column :advance_molecular_rheometers, :status, :string
    add_column :advance_molecular_rheometers, :debit, :string
    add_column :advance_molecular_rheometers, :slottime, :time
    add_column :advance_molecular_rheometers, :slotdate, :date
    remove_column :advance_molecular_rheometers, :type
    add_column :advance_molecular_rheometers, :stype, :string
    change_column(:advance_molecular_rheometers,:sample,:integer)
    change_column(:advance_molecular_rheometers,:size,:float)
    change_column(:advance_molecular_rheometers,:temperature,:float)
    change_column(:advance_molecular_rheometers,:current,:integer)
    change_column(:advance_molecular_rheometers,:shear_rate,:integer)
    add_reference :advance_molecular_rheometers, :user, foreign_key: true
  end
end
