class  AddForiegnKeyToAnswer < ActiveRecord::Migration[7.0]
  def change
      add_reference :answers, :question, foreign_key: true
      add_reference :answers, :equipment, foreign_key: true
    end
end
