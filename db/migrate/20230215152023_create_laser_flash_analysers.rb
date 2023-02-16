class CreateLaserFlashAnalysers < ActiveRecord::Migration[7.0]
  def change
    create_table :laser_flash_analysers do |t|
      t.string :name

      t.timestamps
    end
  end
end
