module Types
  class DocumentTokenCountType < Types::BaseObject
    description "A Dtl token Data"
    field :uuid, String, null: false
    field :token, String, null: false
    field :count, Int, null: false
  end
end
