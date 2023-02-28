class AddColumnTohr < ActiveRecord::Migration[6.1]
  def change
    add_column :hrlcms, :status, :string
    add_column :hrlcms, :debit, :string
    add_column :hrlcms, :slottime, :time
    add_column :hrlcms, :slotdate, :date
    add_reference :hrlcms, :user, foreign_key: true
  end
end
