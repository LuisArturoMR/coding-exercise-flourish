class AddActionToRewardLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :reward_logs, :action, :string
  end
end
