class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :event_logs, :type, :event
  end
end
