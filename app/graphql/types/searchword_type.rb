module Types
  class SearchwordType < Types::BaseObject
    description "A daily numbers data"
    field :id, String, null: true
    field :word, String, null: true
    field :start_date, String, null: true
    field :end_date, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
