class AddRefernceIntegratedMultiRole < ActiveRecord::Migration[6.1]
  def change
      add_reference :integrated_multi_role_testers, :user, foreign_key: true
  end
end
