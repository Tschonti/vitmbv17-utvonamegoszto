require "test_helper"

class EffortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @effort = efforts(:one)
  end

  test "should create effort" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      user: {username: users(:one).username, password: 'test123'}}
    assert_response :redirect
    follow_redirect!
    assert_equal session[:current_user_id], users(:one).id

    assert_difference("Effort.count") do
      post "#{efforts_url}.json", params: { effort: { user_id: @effort.user_id, route_id: @effort.route_id, time: @effort.time, effort_type: @effort.effort_type } }
    end

    assert_response :created
  end

  test "should throw error with bad effort" do
    post url_for(controller: 'sessions', action: 'create'), params: {
      user: {username: users(:one).username, password: 'test123'}}
    assert_response :redirect
    follow_redirect!
    assert_equal session[:current_user_id], users(:one).id

    assert_no_difference("Effort.count") do
      post "#{efforts_url}.json", params: { effort: { user_id: @effort.user_id, route_id: @effort.route_id, time: 'xxx', effort_type: @effort.effort_type } }
    end

    assert_response :unprocessable_entity
  end

  test "should update effort" do
    patch "#{effort_url(@effort)}.json", params: { effort: { user_id: @effort.user_id, route_id: @effort.route_id, time: @effort.time, effort_type: @effort.effort_type } }
    assert_response :success
  end

  test "should destroy effort" do
    assert_difference("Effort.count", -1) do
      delete "#{effort_url(@effort)}.json"
    end

    assert_response :success
  end
end
