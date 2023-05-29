require "test_helper"

class CreateRouteTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @route = routes(:one)
  end

  test "create_route" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      username: @user.username, password: 'test1'}
    assert_response :redirect
    follow_redirect!
    assert_equal Current.user.id, @user.id

    assert_select 'a', 'Új útvonal'
    post routes_url, params: { route: { distance: @route.distance, elevation: @route.elevation, link: @route.link, name: @route.name } }
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', @route.name
  end
end
