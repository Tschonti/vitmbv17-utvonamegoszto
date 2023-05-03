require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "username uniqueness" do
    u1 = User.new
    u1.username = 'test'
    u1.password_digest = 'ss'
    u1.save

    u2 = User.new
    u2.username = 'test'
    u2.password_digest = 'ss'
    assert !u2.save, 'Uniqueness doesn\'t work'
  end
end
