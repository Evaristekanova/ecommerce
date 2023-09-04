require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference('User.count') do
    post api_v1_users_url, params: { user: { email:'test@test.org', password: '123456' } }, as: :json
    end
    assert_response :created
  end

  test "should not create user with invalid email" do
    user = User.new(email: "text@1", password_digest: "123456")
    assert_not user.valid?
  end

  test "should not create user with existing email" do
    user = User.new(email: "one@one.gmail", password_digest: "123456")
    assert_not user.valid?
  end
end
