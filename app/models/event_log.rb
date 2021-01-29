class EventLog < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :reward_points, presence: true
  validates :user_id, presence: true
end
