class AddForiegnKey < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :equipment, foreign_key: true
  end
end
