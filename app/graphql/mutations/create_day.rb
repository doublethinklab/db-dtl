class Mutations::CreateDay < Mutations::BaseMutation
  argument :domain, String, required: false
  argument :date, String, required: false
  argument :creator_id, String, required: false
  argument :channel_id, String, required: false
  argument :num, Int, required: false

  field :day, Types::DayType, null: false
  field :errors, [String], null: false

  def resolve(
    domain: nil,
    date: nil,
    channel_id: nil,
    creator_id: nil,
    num: nil
    )
    day = Day.create!(
      domain: domain,
      date: date,
      channel_id: channel_id,
      creator_id: creator_id,
      num: num
    )
    #  if context[:current_user]

    if day
      {
        day: day,
        errors: []
      }
    else
      {
        day: nil,
        errors: order.errors.full_messages
      }
    end
  end
end
