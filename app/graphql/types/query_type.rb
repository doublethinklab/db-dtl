module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :list_dtls, [Types::DtlType], null: true do
      description "Returns DTL datas"
      argument :text, String, required: true
    end

    # First describe the field signature:
    field :get_dtl, DtlType, null: true do
      description "Find a Dtl by ID"
      argument :id, ID, required: true
    end

    # First describe the field signature:
    field :all_domains, [Types::DomainType], null: true do
      description "List all domains"
    end

    field :all_twitters, [Types::TwitterType], null: true do
      description "List all twitter accounts"
    end

    field :all_dtls, resolver: Resolvers::DtlsSearch
    # field :all_searchwords, resolver: Resolvers::SearchwordsSearch

    # Then provide an implementation:
    def get_dtl(id:)
      Dtl.find(id)
    end

    def all_domains
      Day.pluck(:domain).compact.uniq.sort.map{|x| {domain: x}}
    end

    def list_dtls(text:)
      Dtl.where("content LIKE ?", "%#{text}%")
    end

    field :all_days, resolver: Resolvers::DaysSearch

    def all_twitters
      Twitter.all
    end
  end
end
