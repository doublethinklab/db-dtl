module Types
  class MutationType < Types::BaseObject
    field :create_dtl, mutation: Mutations::CreateDtl
    field :create_user, mutation: Mutations::CreateUser
    field :create_label, mutation: Mutations::CreateLabel
    field :signin_user, mutation: Mutations::SignInUser
  end
end
