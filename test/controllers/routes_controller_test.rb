require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
    @third_route = routes(:three)
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
      user: {username: users(:one).username, password: 'test123'}}
    assert_response :redirect
    follow_redirect!
    assert_equal session[:current_user_id], users(:one).id
    get route_url(@route)
    assert_response :success
  end

  test "should get edit" do
    get edit_route_url(@route)
    assert_response :redirect
  end

  test "should update route" do
    patch route_url(@route), params: { route: { distance: @route.distance, elevation: @route.elevation, link: @route.link, name: @route.name } }
    assert_redirected_to route_url(@route)
  end

  test "should destroy route" do
    assert_difference("Route.count", -1) do
      delete "#{route_url(@third_route)}.json"
    end

    assert_response :no_content
  end
end
