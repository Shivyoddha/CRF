class CreateMultiPurposeImpacts < ActiveRecord::Migration[7.0]
  def change
    create_table :multi_purpose_impacts do |t|
      t.string :name

      t.timestamps
    end
  end
end
