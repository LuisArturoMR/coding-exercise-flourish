class AddTypeToEventLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :event_logs, :type, :string
    add_column :event_logs, :rewarded, :boolean
  end
end
