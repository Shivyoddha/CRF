class AddReferenceToFaculty < ActiveRecord::Migration[6.1]
  def change
      add_reference :users, :faculty, foreign_key: true
  end
end
