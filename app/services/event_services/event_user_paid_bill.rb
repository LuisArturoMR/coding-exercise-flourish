module EventServices
  class EventUserPaidBill
    def self.new(create_params)
      points_to_reward = (create_params[:paid]).to_i / 50 * 10
      event_data = { "date" => create_params[:date], "reward_points" => points_to_reward, "event" => create_params[:event], "rewarded" => points_to_reward > 0 }
      if points_to_reward > 0
        reward_data = { "name" => create_params[:event], "description" => "Paid on Time has benefits", "points_cost" => points_to_reward, "date" => create_params[:date], "action" => "obtain"}
        @reward = Current.user.reward_logs.create!(reward_data)
      end
      @event_log = Current.user.event_logs.create!(event_data)
    end
  end
end
