
class RewardsController < ApplicationController
  # GET /rewards
  def index
    @rewards_log = RewardLog.where.not(id: nil)
    render json: @rewards_log, status: :ok
  end

end