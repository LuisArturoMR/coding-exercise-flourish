class User < ApplicationRecord
  has_many :event_logs
  has_many :reward_logs

  validates :email, presence: true
  validates :password, presence: true
  validates :points, presence: true
  validates :balance, presence: true
end
