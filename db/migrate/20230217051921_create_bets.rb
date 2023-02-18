class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.string :sample
      t.string :degassing
      t.string :analysis
      t.string :incompatibe
      t.string :toxicity
      t.string :disposal
      t.string :more

      t.timestamps
    end
  end
end
