require 'test_helper'

class Mutations::CreateDtlTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateDtl.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new dtl' do
    dtl = perform(
      url: 'http://example.com',
      description: 'description'
    )[:dtl]

    assert dtl.persisted?
    assert_equal dtl.description, 'description'
    assert_equal dtl.url, 'http://example.com'
  end
end