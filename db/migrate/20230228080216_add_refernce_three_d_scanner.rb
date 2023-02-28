class AddRefernceThreeDScanner < ActiveRecord::Migration[6.1]
  def change
      add_reference :three_d_scanners, :user, foreign_key: true
  end
end
