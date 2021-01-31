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

    when "UserMadeDepositIntoSavingsAccount"
    else
      render json: {error: 'Event Not Found'}, status: :not_found
    end
  end

  def create_params
    params.permit(:date, :event)
  end

  private
  def authenticate_user!
    AuthenticateUserService.authenticate_user(request.headers)
  end
end