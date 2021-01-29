require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:email)
      should validate_presence_of(:password)
      should validate_presence_of(:points)
      should validate_presence_of(:balance)
    end

    it "validate relation" do
      should have_many(:event_logs)
      should have_many(:reward_logs)
    end
  end
end
