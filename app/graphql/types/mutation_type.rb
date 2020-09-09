module Types
  class MutationType < Types::BaseObject
    field :create_dtl, mutation: Mutations::CreateDtl
    field :create_user, mutation: Mutations::CreateUser
    field :create_label, mutation: Mutations::CreateLabel
    field :create_document_token_count, mutation: Mutations::CreateDocumentTokenCount
    field :create_document_lexical_category_count, mutation: Mutations::CreateDocumentLexicalCategoryCount
    field :signin_user, mutation: Mutations::SignInUser
  end
end
