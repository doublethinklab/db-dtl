module Types
  class MutationType < Types::BaseObject
    field :create_dtl, mutation: Mutations::CreateDtl
    field :create_user, mutation: Mutations::CreateUser
  end
end
