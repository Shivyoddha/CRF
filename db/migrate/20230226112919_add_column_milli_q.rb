class AddColumnMilliQ < ActiveRecord::Migration[6.1]
  def change
    add_column:milli_qs,:projectfund ,:string
  end
end
