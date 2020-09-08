require 'test_helper'

module Resolvers
  class DtlsSearchTest < ActiveSupport::TestCase
    def find(args)
      ::Resolvers::DtlsSearch.call(nil, args, nil)
    end

    def create_dtl(**attributes)
      Dtl.create! attributes
    end

    test 'filter option' do
      link1 = create_dtl description: 'test1', url: 'http://test1.com'
      link2 = create_dtl description: 'test2', url: 'http://test2.com'
      link3 = create_dtl description: 'test3', url: 'http://test3.com'

      result = find(
        filter: {
          description_contains: 'test1',
          OR: [{
            url_contains: 'test2',
            OR: [{
              url_contains: 'test3'
            }]
          }, {
            description_contains: 'test2'
          }]
        }
      )

      assert_equal result.map(&:description).sort, [link1, link2, link3].map(&:description).sort
    end
  end
end