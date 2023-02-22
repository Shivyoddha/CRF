class Addrefernces < ActiveRecord::Migration[6.1]
  def change
    add_reference :hr_fesem_js, :user, foreign_key: true
  end
end
