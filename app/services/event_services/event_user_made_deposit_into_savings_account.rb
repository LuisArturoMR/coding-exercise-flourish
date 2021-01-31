require 'rest-client'

module EventServices
  class EventUserMadeDepositIntoSavingsAccount
    def self.new(create_params)
      rewarded_points = 0
      response = RestClient.get("https://my-json-server.typicode.com/LuisArturoMR/fake_api_bank/accounts", {accept: :json})
      bank_accounts = JSON.parse(response)
      balance = bank_accounts.select { |k,v| k['type'] == "SAVINGS_ACCOUNT" }[0]["balance"]
      Current.user.update! ({"balance" => balance})
      if create_params[:save].to_i >= 5
        if Current.user.balance >= 50 && Current.user.points >= 700
          !rewarded_points = 1000
          !user_add_points = Current.user.points + 1000
          Current.user.update! ({"points" => user_add_points})
          reward_data = { "name" => create_params[:event], "description" => "Saving money is the best", "points_cost" => rewarded_points, "date" => create_params[:date], "action" => "obtain"}
          @reward = Current.user.reward_logs.create!(reward_data)
        end
      end
      event_data = { "date" => create_params[:date], "reward_points" => rewarded_points, "event" => create_params[:event], "rewarded" => rewarded_points > 0 }
      @event_log = Current.user.event_logs.create!(event_data)
    end
  end
end