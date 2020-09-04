module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    # First describe the field signature:
    field :dtl, DtlType, null: true do
      description "Find a Dtl by ID"
      argument :id, ID, required: true
    end
  
    # Then provide an implementation:
    def dtl(id:)
      Dtl.find(id)
    end
  end
end