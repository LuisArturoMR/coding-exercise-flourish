class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:redeems]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # POST /users/:user_id/redeems
  def redeems
    if Current.user.points < 500
      render json: {error: 'The cost is mayor than the user points balance'}, status: :unauthorized
    else
      redeem_params = {"name" => create_params[:name], "description" => "Amazon Gift Card in exchange 500 points", "points_cost" => 500, "date" => create_params[:date], user_id: params[:id], "action" => "redeem"}
      @redeem_log = RewardLog.create!(redeem_params)
      render json: @redeem_log, status: :created
    end
  end

  def create_params
    params.permit(:name, :date)
  end

  private

  def authenticate_user!
    AuthenticateUserService.authenticate_user(request.headers)
  end

end