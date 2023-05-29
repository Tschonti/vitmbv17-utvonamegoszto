require "application_system_test_case"

class CreateRoutesTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    @route = routes(:one)
  end

  test 'create_route' do
    visit login_path

    fill_in "Felhasználónév", with: @user.username
    fill_in "Jelszó", with: 'test1'
    click_on "Bejelentkezés"
    assert_selector 'a', text: "Kijelentkezés"

    click_on "Új útvonal"
    fill_in "route[name]", with: @route.name
    fill_in "route[distance]", with: @route.distance
    fill_in "route[elevation]", with: @route.elevation
    fill_in "route[link]", with: @route.link
    click_on "Mentés"

    assert_selector 'a', text: @route.name
  end
end
