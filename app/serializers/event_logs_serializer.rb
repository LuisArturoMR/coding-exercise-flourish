class EventLogsSerializer < ActiveModel::Serializer
  attributes :id, :date, :reward_points, :event, :rewarded, user
end
