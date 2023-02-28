class AddRefernceProbeSonicator < ActiveRecord::Migration[6.1]
  def change
    add_reference :probe_sonicators, :user, foreign_key: true
  end
end
