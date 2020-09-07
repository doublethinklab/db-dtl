module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :get_dtls, [Types::DtlType], null: true do
      description "Returns a list of products in fashion store"
    end
    # First describe the field signature:
    field :get_dtl, DtlType, null: true do
      description "Find a Dtl by ID"
      argument :id, ID, required: true
    end
  
    # Then provide an implementation:
    def get_dtl(id:)
      Dtl.find(id)
    end

    def get_dtls
      Dtl.all
    end
  end
end
