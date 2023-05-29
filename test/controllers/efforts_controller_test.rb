require "test_helper"

class EffortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @effort = efforts(:one)
  end

  test "should create effort" do
    assert_difference("Effort.count") do
      post efforts_url, params: { effort: { name: @effort.name, route_id: @effort.route_id, time: @effort.time, type: @effort.type } }
    end

    assert_response :created
  end

  test "should throw error with bad effort" do
    assert_no_difference("Effort.count") do
      post efforts_url, params: { effort: { name: @effort.name, route_id: @effort.route_id, time: 'xxx', type: @effort.type } }
    end

    assert_response :bad_request
  end

  test "should update effort" do
    patch effort_url(@effort), params: { effort: { name: @effort.name, route_id: @effort.route_id, time: @effort.time, type: @effort.type } }
    assert_response :success
  end

  test "should destroy effort" do
    assert_difference("Effort.count", -1) do
      delete effort_url(@effort)
    end

    assert_response :success
  end
end
