class Mutations::CreateTwitter < Mutations::BaseMutation
  argument :source, String, required: true
  argument :creator_id, String, required: false

  field :twitter, Types::TwitterType, null: false
  field :errors, [String], null: false

  def resolve(
    source: nil,
    creator_id: nil
    )
    twitter = Twitter.create!(
      source: source,
      creator_id: creator_id
    )
    Thread.new do
      begin
        uri = URI("https://#{ENV['CTCSVHOST']}/first_twints")
        Net::HTTP.get_response(uri).body.to_i
      rescue => exception
        p exception
      end
    end

    if twitter
      {
        twitter: twitter,
        errors: []
      }
    end
  end
end
