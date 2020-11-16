module Types
  class TwitterType < Types::BaseObject
    field :id, ID, null: false
    field :source, String, null: false
    field :creator_id, String, null: false
  end
end
