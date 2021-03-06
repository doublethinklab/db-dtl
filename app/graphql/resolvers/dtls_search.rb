require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::DtlsSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)


  OrderEnum = GraphQL::EnumType.define do
    name 'DtlOrder'

    value 'RECENT'
    value 'UPDATED'
    value 'PUBLISHED'
  end

  option :order, type: OrderEnum, default: 'RECENT'

  def apply_order_with_recent(scope)
    scope.order 'created_at DESC'
  end

  def apply_order_with_updated(scope)
    scope.order 'updated_at DESC'
  end

  def apply_order_with_published(scope)
    scope.order 'pub_time DESC'
  end

  option :first, type: types.Int, with: :apply_first
  option :skip, type: types.Int, with: :apply_skip

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_skip(scope, value)
    scope.offset(value)
  end

  # scope is starting point for search
  scope { Dtl.all }

  type types[Types::DtlType]

  # inline input type definition for the advanced filter
  class DtlFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :source_contains, String, required: false
    argument :id_contains, ID, required: false
    argument :uuid_contains, String, required: false
    # argument :url_contains, String, required: false
    argument :platform_id_contains, String, required: false
    argument :link_contains, String, required: false
    argument :domain_contains, String, required: false
    argument :channel_id_contains, String, required: false
    argument :channel_name_contains, String, required: false
    argument :creator_id_contains, String, required: false
    argument :creator_name_contains, String, required: false
    argument :title_contains, String, required: false
    argument :description_contains, String, required: false
    argument :content_contains, String, required: false
    argument :label_contains, String, required: false
    argument :text_contains, String, required: false
    argument :language_contains, String, required: false
    argument :search_contains, String, required: false
    argument :original_source_name_contains, String, required: false
    argument :original_source_url_contains, String, required: false
    argument :original_source_check_contains, String, required: false
    argument :pub_time_contains, String, required: false
    argument :pub_time_start_date, String, required: false
    argument :pub_time_end_date, String, required: false
    argument :token, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: DtlFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    # allow_user = Apiuser.find_by(token: value[:token])
    # if allow_user.present?
    #   allow_user.usage += 1
    #   allow_user.save
    #   scope = Dtl.all
    # else
    #   scope = Dtl.none
    # end
    scope = Dtl.all

    if value[:pub_time_contains]
      t=value[:pub_time_contains].split('xxx')
      s=t[0].to_date
      e=t[1].to_date + 1.day
      scope = scope.where(pub_time: s..e)
    end

    scope = scope.where(pub_time: value[:pub_time_start_date].to_datetime.localtime.beginning_of_day..value[:pub_time_end_date].to_datetime.localtime.end_of_day) if (value[:pub_time_start_date] && value[:pub_time_end_date])
    scope = scope.where('source = ?', "#{value[:source_contains]}") if value[:source_contains]
    scope = scope.where('id = ?', "#{value[:id_contains]}") if value[:id_contains]
    scope = scope.where('uuid = ?', "#{value[:uuid_contains]}") if value[:uuid_contains]
    # scope = scope.where('url LIKE ?', "%#{value[:url_contains]}%") if value[:url_contains]
    scope = scope.where('platform_id = ?', "%{value[:platform_id_contains]}") if value[:platform_id_contains]
    scope = scope.where('link LIKE ?', "%#{value[:link_contains]}%") if value[:link_contains]
    scope = scope.where('domain LIKE ?', "%#{value[:domain_contains]}%") if value[:domain_contains]
    scope = scope.where('channel_id = ?', "#{value[:channel_id_contains]}") if value[:channel_id_contains]
    scope = scope.where('channel_name LIKE ?', "%#{value[:channel_name_contains]}%") if value[:channel_name_contains]
    scope = scope.where('creator_id = ?', "#{value[:creator_id_contains]}") if value[:creator_id_contains]
    scope = scope.where('creator_name LIKE ?', "%#{value[:creator_name_contains]}%") if value[:creator_name_contains]
    scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value[:title_contains]
    scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
    scope = scope.where('content LIKE ?', "%#{value[:content_contains]}%") if value[:content_contains]
    scope = scope.where('search LIKE ?', "%#{value[:search_contains]}%") if value[:search_contains]
    scope = scope.where('original_source_name LIKE ?', "%#{value[:original_source_name_contains]}%") if value[:original_source_name_contains]
    scope = scope.where('original_source_url LIKE ?', "%#{value[:original_source_url_contains]}%") if value[:original_source_url_contains]
    scope = scope.where('original_source_check LIKE ?', "%#{value[:original_source_check_contains]}%") if value[:original_source_check_contains]
    scope = scope.where('language LIKE ?', "%#{value[:language_contains]}%") if value[:language_contains]

    if value[:label_contains]
      label = Label.find_by(name: value[:label_contains]) 
      if label
        scope = scope.where('domain LIKE ?', "%#{label.domain}%") if label.domain
        scope = scope.where('channel_id = ?', "#{label.channel_id}") if label.channel_id 
        scope = scope.where('creator_id = ?', "#{label.creator_id}") if label.creator_id
      else
        scope = Dtl.none
      end
    end

    if value[:text_contains]
      # filter_with_search = scope.where('search LIKE ?', "%#{value[:text_contains]}%") 
      # if filter_with_search.count == 0
      #   scope = scope.where('channel_name LIKE ? OR creator_name LIKE ? OR title LIKE ? OR description LIKE ? OR content LIKE ?', "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%")
      # else 
      #   scope = filter_with_search
      # end

      scope = scope.where('search LIKE ? OR channel_name LIKE ? OR creator_name LIKE ? OR title LIKE ? OR description LIKE ? OR content LIKE ?', "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%", "%#{value[:text_contains]}%")
    end

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end
