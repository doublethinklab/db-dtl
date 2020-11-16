module Types
  class MutationType < Types::BaseObject
    # field :create_day, mutation: Mutations::CreateDay
    field :create_dtl, mutation: Mutations::CreateDtl
    field :update_dtl, mutation: Mutations::UpdateDtl
    field :create_user, mutation: Mutations::CreateUser
    field :create_label, mutation: Mutations::CreateLabel
    field :create_twitter, mutation: Mutations::CreateTwitter
    field :create_document_token_count, mutation: Mutations::CreateDocumentTokenCount
    field :create_document_lexical_category_count, mutation: Mutations::CreateDocumentLexicalCategoryCount
    field :signin_user, mutation: Mutations::SignInUser
  end
end
