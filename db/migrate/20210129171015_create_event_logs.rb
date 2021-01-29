class CreateEventLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :event_logs do |t|
      t.timestamp :date
      t.integer :reward_points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
