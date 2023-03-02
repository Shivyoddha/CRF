class CreateLiquidNitrogens < ActiveRecord::Migration[6.1]
  def change
    create_table :liquid_nitrogens do |t|
      t.float :quantity
      t.string :purpose
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
