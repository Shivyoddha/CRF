class AddreferenceToHrlcm < ActiveRecord::Migration[6.1]
  def change
      remove_column :hrlcms ,:user_id
      add_reference :hrlcms, :user, foreign_key: true
  end
end
