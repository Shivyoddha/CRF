class CreateThreeDNonContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :three_d_non_contacts do |t|
      t.string :sample
      t.string :scant
      t.string :range
      t.string :stepinterval
      t.string :incompatible
      t.string :toxicity
      t.string :more

      t.timestamps
    end
  end
end
