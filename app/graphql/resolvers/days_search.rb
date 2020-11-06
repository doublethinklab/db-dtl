require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::DaysSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  OrderEnum = GraphQL::EnumType.define do
    name 'DayOrder'

    value 'RECENT'
    value 'OLD'
  end

  option :order, type: OrderEnum, default: 'RECENT'

  def apply_order_with_recent(scope)
    scope.order 'date DESC'
  end

  def apply_order_with_old(scope)
    scope.order 'date ASC'
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
  scope { Day.all }

  type types[Types::DayType]

  # inline input type definition for the advanced filter
  class DayFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :domain_contains, String, required: false
    argument :start_date_is, String, required: true
    argument :end_date_is, String, required: true
    argument :creator_id_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: DayFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Day.all
    scope = scope.where(date: value[:start_date_is]..value[:end_date_is]) if (value[:start_date_is] && value[:end_date_is])
    scope = scope.where('domain LIKE ?', "%#{value[:domain_contains]}%") if value[:domain_contains]
    scope = scope.where('channel_id = ?', "#{value[:channel_id_contains]}") if value[:channel_id_contains]
    scope = scope.where('creator_id = ?', "#{value[:creator_id_contains]}") if value[:creator_id_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end
