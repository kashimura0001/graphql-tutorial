require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new link' do
    result = perform(
      url: 'http://example.com',
      description: 'description'
    )

    assert result[:link].persisted?
    assert_equal result[:link].description, 'description'
    assert_equal result[:link].url, 'http://example.com'
  end
end
