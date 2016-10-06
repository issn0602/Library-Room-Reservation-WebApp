require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @room = Room.new(number: 1234, size: '4 Chairs (Small)', building: 'James D. Hunt Library' )
  end

  test 'room should be valid' do
    assert @room.valid?
  end

  test 'number should be present' do
    @room.number = ''.to_i
    assert_not @room.valid?
  end

  test 'size should be present' do
    @room.size = ''
    assert_not @room.valid?
  end

  test 'building should be present' do
    @room.building = ''
    assert_not @room.valid?
  end

  test 'length should be limited to 140' do
    @room.length = 12345678910111213141516171819202122232425262728293031323334353637383940414243444546474849505152535455565758596061626364656667686970
    assert_not @room.valid?
  end

end