class RewardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # GET /rewards
  def index
    @rewards_log = RewardLog.where(user_id: Current.user.id)
    render json: @rewards_log, status: :ok
  end

  private

  def authenticate_user!
    AuthenticateUserService.authenticate_user(request.headers)
  end

end