class AddreferenceToLow < ActiveRecord::Migration[6.1]
  def change
    add_reference :low_fatigues, :user, foreign_key: true
  end
end
