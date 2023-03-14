class AddColumnHrFesemc < ActiveRecord::Migration[6.1]
  def change
    add_column:hr_fesem_cs,:eds,:string
  end
end
