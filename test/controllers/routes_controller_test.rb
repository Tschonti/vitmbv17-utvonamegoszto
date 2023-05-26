require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
  end

  test "should create route" do
    assert_difference("Route.count") do
      post routes_url, params: { route: { distance: @route.distance, elevation: @route.elevation, link: @route.link, name: @route.name } }
    end

    assert_redirected_to route_url(Route.last)
  end

  test "should redirect from show_route if unauthorized" do
    get route_url(@route)
    assert_response :redirect
  end

  test "should get show_route if authorized" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      username: users(:test1).username, password: 'test1'}
    assert_response :redirect
    follow_redirect!
    assert_equal Current.user.id, users(:test1).id
    get route_url(@route)
    assert_response :success
  end

  test "should get edit" do
    get edit_route_url(@route)
    assert_response :success
  end

  test "should update route" do
    patch route_url(@route), params: { route: { distance: @route.distance, elevation: @route.elevation, link: @route.link, name: @route.name } }
    assert_redirected_to route_url(@route)
  end

  test "should destroy route" do
    assert_difference("Route.count", -1) do
      delete route_url(@route)
    end

    assert_redirected_to routes_url
  end
end
