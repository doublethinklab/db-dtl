class Mutations::CreateLabel < Mutations::BaseMutation
  argument :tag, String, required: true
  argument :domain, String, required: false
  argument :channel_id, String, required: false
  argument :creator_id, String, required: false


  field :label, Types::LabelType, null: false
  field :errors, [String], null: false

  def resolve(
    tag: nil,
    domain: nil,
    channel_id: nil,
    creator_id: nil
    )
    label = Label.create!(
      tag: tag,
      domain: domain,
      channel_id: channel_id,
      creator_id: creator_id
    )
    if label
      {
        label: label,
        errors: []
      }
    end
  end
end
