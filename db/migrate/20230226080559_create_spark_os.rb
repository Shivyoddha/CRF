class CreateSparkOs < ActiveRecord::Migration[6.1]
  def change
    create_table :spark_os do |t|
      t.integer :sample
      t.string :composition
      t.integer :samplefe
      t.integer :sampleni
      t.integer :samplezn
      t.integer :samplesn
      t.integer :samplecu
      t.integer :sampleti
      t.integer :sampleal
      t.integer :samplepb
      t.integer :samplemg
      t.string :more
      t.string :debit
      t.date :slotdate
      t.time :slottime
      t.string :status

      t.timestamps
    end
  end
end
