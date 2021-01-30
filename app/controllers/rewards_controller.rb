--
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
    #read HEADER auth
    token_regex = /Bearer (\w+)/
    headers = request.headers
    # verify token is valid
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
    # verify token correspond to the user
      if (Current.user = User.find_by_token_auth(token))
        return
      end
    end
    render json: {error: 'Unauthorized'}, status: :unauthorized
  end

end