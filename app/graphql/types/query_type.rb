module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    # First describe the field signature:
    field :get_dtl, DtlType, null: true do
      description "Find a Dtl by ID"
      argument :id, ID, required: true
    end
  
    # Then provide an implementation:
    def get_dtl(id:)
      Dtl.find(id)
    end
  end
end
