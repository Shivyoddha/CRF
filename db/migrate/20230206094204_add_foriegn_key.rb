class AddForiegnKey < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :equipment, foreign_key: true
  end
end
