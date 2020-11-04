module Types
  class DayType < Types::BaseObject
    description "A daily numbers data"
    field :domain, String, null: true
    field :channel_id, String, null: true
    field :creator_id, String, null: true
    field :date, String, null: true
    field :num, Int, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
