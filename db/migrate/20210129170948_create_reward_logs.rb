class CreateRewardLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :reward_logs do |t|
      t.string :name
      t.string :description
      t.integer :points_cost
      t.timestamp :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
