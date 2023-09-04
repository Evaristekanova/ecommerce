require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user with valid email" do
    user = User.new(email: "text@1.rw", password_digest: "123456")
    assert user.valid?
  end

  test "should not create user with invalid email" do
    user = User.new(email: "text1", password_digest: "123456")
    assert_not user.valid?
  end

  test "should not create user with existing email" do
    user = User.new(email: "one@one.gmail", password_digest: "123456")
    assert_not user.valid?
  end
end
