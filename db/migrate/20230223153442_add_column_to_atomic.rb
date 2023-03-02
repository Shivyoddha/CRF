class AddColumnToAtomic < ActiveRecord::Migration[6.1]
  def change
    change_column(:atomic_force_microscopes,:sample,:integer)
    change_column(:atomic_force_microscopes,:x,:float)
    change_column(:atomic_force_microscopes,:y,:float)
    change_column(:atomic_force_microscopes,:scan_rate,:float)
  end
end
