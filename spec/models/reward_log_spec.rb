require 'rails_helper'

RSpec.describe RewardLog, type: :model do

  it "validate presence of required fields" do
    should validate_presence_of(:name)
    should validate_presence_of(:description)
    should validate_presence_of(:points_cost)
    should validate_presence_of(:date)
    should validate_presence_of(:user_id)
  end

end
