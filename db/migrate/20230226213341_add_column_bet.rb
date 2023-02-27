class AddColumnBet < ActiveRecord::Migration[6.1]
  def change
    add_column :bets, :status, :string
    add_column :bets, :slottime, :time
    add_column :bets, :slotdate, :date
    add_column :bets, :debit, :string
    change_column(:bets,:sample,:integer)
    add_column :bets,  :analysiscustom, :string
    add_column :bets,  :analysisstandard, :string
    remove_column  :bets,:analysis
  end
end
