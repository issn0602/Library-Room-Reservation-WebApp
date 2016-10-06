require 'test_helper'

class RoomsControllerTest < ActionController::TestCase

  setup do
    @room = rooms(:one)
  end

  test "should get room index" do
    get :home
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test "should get new" do
    get :index
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post :create, room: { booking_date: @room.booking_date, name: @room.name, size: @room.size, status: @room.status, time_slot: @room.time_slot }
    end
    assert_redirected_to room_path(assigns(:room))
  end

  test "should show room" do
    get :show, id: @room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room
    assert_response :success
  end

  test "should update room" do
    patch :update, id: @room, room: { booking_date: @room.booking_date, name: @room.name, size: @room.size, status: @room.status, time_slot: @room.time_slot }
    assert_redirected_to room_path(assigns(:room))
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete :destroy, id: @room
    end
    assert_redirected_to rooms_path
  end

end