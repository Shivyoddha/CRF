class AddRefernceUltraCentrifuge < ActiveRecord::Migration[6.1]
  def change
      add_reference :ultra_centrifuges, :user, foreign_key: true
  end
end
