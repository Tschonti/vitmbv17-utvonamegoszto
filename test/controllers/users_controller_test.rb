require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "register user" do
    assert_difference("User.count") do
      post url_for(controller: 'users', action: 'create'), params: {user: {
        username: 'new user', password: 'test1234'}}
      assert_response :redirect
    end

    post url_for(controller: 'sessions', action: 'create'), params: {user: {
      username: 'new user', password: 'test1234'}}
    assert_response :redirect
    follow_redirect!
    assert_not_nil session[:current_user_id]
    assert_equal User.find_by(id: session[:current_user_id]).username, 'new user'
  end

  test "try to register user with invalid data" do
    post url_for(controller: 'users', action: 'create'), params: {user: {
      username: users(:one).username, password: 'test1234'}} # username already exists
    assert_response :unprocessable_entity
  end
end
