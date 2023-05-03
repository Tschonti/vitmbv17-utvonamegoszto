require "test_helper"

class EffortTest < ActiveSupport::TestCase
  test 'time wrong format' do
    e = Effort.new
    e.time = '1:00'
    e.effort_type = 1

    assert !e.save, 'time wrong format doesn\'t fail'
  end

  test 'invalid effort type' do
    e = Effort.new
    e.time = '00:01:00'
    e.effort_type = 99

    assert !e.save, 'invalid effort type doesn\'t fail'
  end
end
