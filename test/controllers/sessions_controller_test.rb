require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      username: users(:test1).username, password: 'test1'}
    assert_response :redirect
    follow_redirect!
    assert_equal Current.user.id, users(:test1).id
  end

  test "invalid login" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      username: users(:test1).username, password: 'test123'}
    assert_response :redirect
    follow_redirect!
    assert_nil Current.user
  end

  test "logout" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      username: users(:test1).username, password: 'test1'}
    assert_response :redirect
    follow_redirect!
    assert_equal Current.user.id, users(:test1).id

    get logout_path
    assert_nil Current.user
  end
end
