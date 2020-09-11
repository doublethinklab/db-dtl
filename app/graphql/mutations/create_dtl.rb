class Mutations::CreateDtl < Mutations::BaseMutation
  argument :source, String, required: false
  argument :url, String, required: true
  argument :platform_id, String, required: false
  argument :link, String, required: false
  argument :domain, String, required: false
  argument :channel_id, String, required: false
  argument :channel_name, String, required: false
  argument :creator_id, String, required: false
  argument :creator_name, String, required: false
  argument :title, String, required: false
  argument :description, String, required: false
  argument :content, String, required: false
  argument :media_meta, String, required: false
  argument :system_meta, String, required: false
  argument :pub_time, String, required: false

  field :dtl, Types::DtlType, null: false
  field :errors, [String], null: false

  def resolve(
    source: nil,
    url: nil,
    platform_id: nil,
    link: nil,
    domain: nil,
    channel_id: nil,
    channel_name: nil,
    creator_id: nil,
    creator_name: nil,
    title: nil,
    description: nil,
    content: nil,
    media_meta: nil,
    system_meta: nil,
    pub_time: nil
    )
    dtl = Dtl.create!(
      source: source,
      url: url,
      platform_id: platform_id,
      link: link,
      domain: domain,
      channel_id: channel_id,
      channel_name: channel_name,
      creator_id: creator_id,
      creator_name: creator_name,
      title: title,
      description: description,
      content: content,
      media_meta: media_meta,
      system_meta: system_meta,
      pub_time: pub_time,
    )
    #  if context[:current_user]
    
    if dtl
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
