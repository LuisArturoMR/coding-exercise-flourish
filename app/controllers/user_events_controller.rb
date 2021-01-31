class UserEventsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # POST /user_event
  def create
    @streak = EventLog.where(user_id: Current.user.id, date: Time.zone.now().end_of_day - 7.days..Time.zone.now().end_of_day)
    if @streak.size == 6
      !reward_points = 200
    else
      !reward_points = 10
    end
    event_data = { "date" => create_params[:date], "reward_points" => reward_points, "event" => create_params[:event], "rewarded" => true }

    @event_log = Current.user.event_logs.create!(event_data)
    render json: @event_log, status: :created
  end

  def create_params
    params.permit(:date, :event)
  end

  private
  def authenticate_user!
    AuthenticateUserService.authenticate_user(request.headers)
  end
end