class CreateAnsies < ActiveRecord::Migration[6.1]
  def change
    create_table :ansies do |t|
      t.integer :sysno
      t.string :slotdate
      t.text :purpose
      t.float :amount
      t.string :debit

      t.timestamps
    end
  end
end
