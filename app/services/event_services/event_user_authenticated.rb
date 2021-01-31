module EventServices
  class EventUserAuthenticated
    def self.new(create_params)
      @streak = EventLog.where(user_id: Current.user.id, date: Time.zone.now().end_of_day - 7.days..Time.zone.now().end_of_day)
      if @streak.size == 6
        !reward_points = 200
      else
        !reward_points = 10
      end
      event_data = { "date" => create_params[:date], "reward_points" => reward_points, "event" => create_params[:event], "rewarded" => true }

      @event_log = Current.user.event_logs.create!(event_data)
    end
  end
end