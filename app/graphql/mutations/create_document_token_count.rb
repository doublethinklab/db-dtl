class Mutations::CreateDocumentTokenCount < Mutations::BaseMutation
  argument :uuid, String, required: true
  argument :token, String, required: true
  argument :count, Int, required: true


  field :document_token_count, Types::DocumentTokenCountType, null: false
  field :errors, [String], null: false

  def resolve(
    uuid: nil,
    token: nil,
    count: nil
    )
    document_token_count = DocumentTokenCount.create!(
      uuid: uuid,
      token: token,
      count: count
    )
    if document_token_count
      {
        document_token_count: document_token_count,
        errors: []
      }
    end
  end
end
