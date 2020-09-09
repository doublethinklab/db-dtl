module Types
  class LabelType < Types::BaseObject
    description "A Dtl Label Data"
    field :id, ID, null: false
    field :uuid, String, null: false
    field :tag, String, null: true
    field :domain, String, null: false
    field :channel_id, String, null: false
    field :creator_id, String, null: false
  end
end
