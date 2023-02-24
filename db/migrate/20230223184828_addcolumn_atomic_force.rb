class AddcolumnAtomicForce < ActiveRecord::Migration[6.1]
  def change
    add_column:atomic_force_microscopes,:status ,:string
    add_column:atomic_force_microscopes,:slotdate ,:date
    add_column:atomic_force_microscopes,:slottime ,:time
    add_column:atomic_force_microscopes,:debit ,:string
    change_column(:atomic_force_microscopes,:sample,:integer)
  end
end
