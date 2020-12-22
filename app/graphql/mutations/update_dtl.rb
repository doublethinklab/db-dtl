class Mutations::UpdateDtl < Mutations::BaseMutation
  argument :url, String, required: true
  argument :title, String, required: false
  argument :content, String, required: false
  argument :description, String, required: false
  argument :pub_time, String, required: false
  argument :language, String, required: false
  argument :original_source_name, String, required: false
  argument :original_source_url, String, required: false
  argument :original_source_check, String, required: false

  field :dtl, Types::DtlType, null: false
  field :errors, [String], null: false

  def resolve(
    url: nil,
    title: '',
    description: '',
    content: '',
    pub_time: nil,
    original_source_name: nil,
    original_source_url: nil,
    original_source_check: nil
  )
    dtl = Dtl.find_by(url: url)
    dtl.update!(
      title: title.present? ? URI.decode_www_form_component(title) : dtl.title,
      description: description.present? ? URI.decode_www_form_component(description) : dtl.description,
      content: content.present? ? URI.decode_www_form_component(content) : dtl.content,
      pub_time: pub_time || dtl.pub_time,
      original_source_name: original_source_name,
      original_source_url: original_source_url,
      original_source_check: original_source_check
    )

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
