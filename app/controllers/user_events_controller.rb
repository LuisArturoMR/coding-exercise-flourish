class UserEventsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # POST /user_event
  def create
    case create_params[:event]
    when "UserAuthenticated"
      @event_log = EventServices::EventUserAuthenticated.new(create_params)
      render json: @event_log, status: :created
    when "UserPaidBill"
      @event_log = EventServices::EventUserPaidBill.new(create_params)
      render json: @event_log, status: :created
    when "UserMadeDepositIntoSavingsAccount"
      @event_log = EventServices::EventUserMadeDepositIntoSavingsAccount.new(create_params)
      render json: @event_log, status: :created
    else
      render json: {error: 'Event Not Found'}, status: :not_found
    end
  end

  def create_params
    params.permit(:date, :event, :paid, :save)
  end

  private
  def authenticate_user!
    @auth = AuthenticateUserService.authenticate_user(request.headers)
    if @auth == "unauthorized"
      render json: {error: 'Unauthorized'}, status: :unauthorized
    end
  end
end