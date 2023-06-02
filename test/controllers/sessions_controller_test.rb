require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      user: {username: users(:one).username, password: 'test123'}}
    assert_response :redirect
    follow_redirect!
    assert_equal session[:current_user_id], users(:one).id
  end

  test "invalid login" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      user: {username: users(:one).username, password: 'test123456'}}
    assert_response :unprocessable_entity
    assert_nil session[:current_user_id]
  end

  test "logout" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      user: {username: users(:one).username, password: 'test123'}}
    assert_response :redirect
    follow_redirect!
    assert_equal session[:current_user_id], users(:one).id

    get logout_path
    assert_nil Current.user
  end
end
