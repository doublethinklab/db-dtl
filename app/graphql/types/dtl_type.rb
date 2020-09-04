module Types
  class DtlType < Types::BaseObject
    description "A Dtl Raw Data"
    field :id, ID, null: false
    field :title, String, null: true
    field :uuid, String, null: false
    field :url, String, null: true
    field :platform_id, String, null: true
    field :link, String, null: true
    field :domain, String, null: true
    field :channel_id, String, null: true
    field :channel_name, String, null: true
    field :creator_id, String, null: true
    field :creator_name, String, null: true
    field :title, String, null: true
    field :discription, String, null: true
    field :content, String, null: true
    field :media_meta, GraphQL::Types::JSON, null: true
    field :system_meta, GraphQL::Types::JSON, null: true
    field :pub_time, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
