require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "register user" do
    post url_for(controller: 'users', action: 'create'), params: {
      username: 'new user', password: 'test1234'}
    assert_response :created

    post url_for(controller: 'sessions', action: 'create'), params: {
      username: 'new user', password: 'test1234'}
    assert_response :redirect
    follow_redirect!
    assert_equal Current.user.name, 'new user'
  end

  test "try to register user with invalid data" do
    post url_for(controller: 'users', action: 'create'), params: {
      username: users(:one).username, password: 'test1234'} # username already exists
    assert_response :unprocessable_entity
  end
end
