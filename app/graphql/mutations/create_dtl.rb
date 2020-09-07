class Mutations::CreateDtl < Mutations::BaseMutation
  argument :url, String, required: true
  argument :content, String, required: true

  field :dtl, Types::DtlType, null: false
  field :errors, [String], null: false

  def resolve(url:, content:)
      dtl = Dtl.new(url: url, content: content)
      if dtl.save
          {
              dtl: dtl,
              errors: []
          }
      else
          {
              dtl: nil,
              errors: order.errors.full_messages
          }
      end
  end
end