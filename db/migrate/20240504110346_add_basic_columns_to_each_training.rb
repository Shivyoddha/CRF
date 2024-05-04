class AddBasicColumnsToEachTraining < ActiveRecord::Migration[6.1]
  def change
    add_column :training1s, :sample, :integer
    add_column :training1s, :debit, :string
    add_column :training1s, :more, :string
    add_column :training2s, :sample, :integer
    add_column :training2s, :debit, :string
    add_column :training2s, :more, :string
    add_column :training3s, :sample, :integer
    add_column :training3s, :debit, :string
    add_column :training3s, :more, :string
    add_column :training4s, :sample, :integer
    add_column :training4s, :debit, :string
    add_column :training4s, :more, :string

  end
end
