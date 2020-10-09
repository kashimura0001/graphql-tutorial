require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    result = perform(
      name: 'Test User',
      auth_provider: {
        credentials: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    assert result[:user].persisted?
    assert_equal result[:user].name, 'Test User'
    assert_equal result[:user].email, 'email@example.com'
  end
end
