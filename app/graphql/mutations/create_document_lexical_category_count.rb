class Mutations::CreateDocumentLexicalCategoryCount < Mutations::BaseMutation
  argument :uuid, String, required: true
  argument :lexical_category, String, required: true
  argument :count, Int, required: true


  field :document_lexical_category_count, Types::DocumentLexicalCategoryCountType, null: false
  field :errors, [String], null: false

  def resolve(
    uuid: nil,
    lexical_category: nil,
    count: nil
    )
    document_lexical_category_count = DocumentLexicalCategoryCount.create!(
      uuid: uuid,
      lexical_category: lexical_category,
      count: count
    )
    if document_lexical_category_count
      {
        document_lexical_category_count: document_lexical_category_count,
        errors: []
      }
    end
  end
end
