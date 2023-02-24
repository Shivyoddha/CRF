class AddRefernceRamanMicroscope < ActiveRecord::Migration[6.1]
  def change
    add_reference :raman_microscopes, :user, foreign_key: true
  end
end
