class User < ApplicationRecord
  has_many :event_logs
  has_many :reward_logs

  validates :email, presence: true
  validates :points, presence: true
  validates :balance, presence: true
  validates :token_auth, presence: true

  after_initialize :generate_token_auth

  def generate_token_auth
    unless token_auth.present?
      #self.token_auth = TokenGenerationService.generate
      self.token_auth = SecureRandom.hex
    end
  end
end
