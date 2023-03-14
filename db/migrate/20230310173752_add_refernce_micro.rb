class AddRefernceMicro < ActiveRecord::Migration[6.1]
  def change
      add_reference :micro_edms, :user, foreign_key: true
  end
end
