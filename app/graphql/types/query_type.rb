module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :list_dtls, [Types::DtlType], null: true do
      description "Returns a list of products in fashion store"
      argument :text, String, required: true
    end

    # First describe the field signature:
    field :get_dtl, DtlType, null: true do
      description "Find a Dtl by ID"
      argument :id, ID, required: true
    end
  
    field :all_dtls, resolver: Resolvers::DtlsSearch

    # Then provide an implementation:
    def get_dtl(id:)
      Dtl.find(id)
    end

    def list_dtls(text:)
      Dtl.where("content LIKE ?", "%#{text}%")
    end
  end
end
