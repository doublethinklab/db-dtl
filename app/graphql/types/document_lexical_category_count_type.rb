module Types
  class DocumentLexicalCategoryCountType < Types::BaseObject
    description "A Dtl lexical category Data"
    field :uuid, String, null: false
    field :lexical_category, String, null: false
    field :count, Int, null: false
  end
end
