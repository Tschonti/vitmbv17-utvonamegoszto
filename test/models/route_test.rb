require "test_helper"

class RouteTest < ActiveSupport::TestCase
  test "empty route name" do
    r = Route.new
    r.name = ''
    r.link = 'https://example.org'
    r.distance = 2.5
    r.elevation = 200
    assert !r.save, 'Empty route name doesn\'t fail'
  end

  test "invalid link" do
    r = Route.new
    r.name = 'Route1'
    r.link = 'not a link'
    r.distance = 2.5
    r.elevation = 200
    assert !r.save, 'invalid link doesn\'t fail'
  end

  test "distance not a number" do
    r = Route.new
    r.name = 'Route1'
    r.link = 'https://example.org'
    r.distance = 'not a number'
    r.elevation = 200
    assert !r.save, 'distance not a number doesn\'t fail'
  end

  test "elevation not a whole number" do
    r = Route.new
    r.name = 'Route1'
    r.link = 'https://example.org'
    r.distance = 2.5
    r.elevation = 200.12
    assert !r.save, 'elevation not a whole number doesn\'t fail'
  end
end
