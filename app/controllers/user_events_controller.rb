--
class UserEventsController < ApplicationController

  rescue_from Exception do |e|
    render json: {error: e.message}, status: :internal_error
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # POST /user_event
  def create
    @event_log = EventLog.create!(create_params)
    render json: @event_log, status: :created
  end

  def create_params
    params.require(:event).permit(:date, :reward_points, :user_id, :date, :reward_points)
  end

end