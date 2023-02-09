class AddForiegnKeyToBrief < ActiveRecord::Migration[7.0]
  def change
    add_reference :briefs, :equipment, foreign_key: true
    add_reference :briefs, :title, foreign_key: true
    add_reference :briefs, :content, foreign_key: true
  end
end
