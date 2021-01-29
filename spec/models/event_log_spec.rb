require 'rails_helper'

RSpec.describe EventLog, type: :model do
  it "validate presence of required fields" do
    should validate_presence_of(:date)
    should validate_presence_of(:reward_points)
    should validate_presence_of(:user_id)
  end
end
