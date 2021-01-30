class RewardLog < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :points_cost, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
  validates :action, presence: true
end
