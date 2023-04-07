require "application_system_test_case"

class EffortsTest < ApplicationSystemTestCase
  setup do
    @effort = efforts(:one)
  end

  test "visiting the index" do
    visit efforts_url
    assert_selector "h1", text: "Efforts"
  end

  test "should create effort" do
    visit efforts_url
    click_on "New effort"

    fill_in "Name", with: @effort.name
    fill_in "Route", with: @effort.route_id
    fill_in "Time", with: @effort.time
    fill_in "Type", with: @effort.type
    click_on "Create Effort"

    assert_text "Effort was successfully created"
    click_on "Back"
  end

  test "should update Effort" do
    visit effort_url(@effort)
    click_on "Edit this effort", match: :first

    fill_in "Name", with: @effort.name
    fill_in "Route", with: @effort.route_id
    fill_in "Time", with: @effort.time
    fill_in "Type", with: @effort.type
    click_on "Update Effort"

    assert_text "Effort was successfully updated"
    click_on "Back"
  end

  test "should destroy Effort" do
    visit effort_url(@effort)
    click_on "Destroy this effort", match: :first

    assert_text "Effort was successfully destroyed"
  end
end
