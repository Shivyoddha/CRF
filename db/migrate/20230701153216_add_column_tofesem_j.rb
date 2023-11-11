class AddColumnTofesemJ < ActiveRecord::Migration[6.1]
  def change
    change_column :hr_fesem_js,:sample, :integer
  end
end
