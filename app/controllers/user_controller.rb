class UserController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # GET /user
  def index
    @user = User.where(id: Current.user.id)
    render json: @user[0], status: :ok
  end

  private

  def authenticate_user!
    AuthenticateUserService.authenticate_user(request.headers)
  end

end