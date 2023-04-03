require "test_helper"

class EventPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_photo = event_photos(:one)
  end

  test "should get index" do
    get event_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_event_photo_url
    assert_response :success
  end

  test "should create event_photo" do
    assert_difference('EventPhoto.count') do
      post event_photos_url, params: { event_photo: {  } }
    end

    assert_redirected_to event_photo_url(EventPhoto.last)
  end

  test "should show event_photo" do
    get event_photo_url(@event_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_photo_url(@event_photo)
    assert_response :success
  end

  test "should update event_photo" do
    patch event_photo_url(@event_photo), params: { event_photo: {  } }
    assert_redirected_to event_photo_url(@event_photo)
  end

  test "should destroy event_photo" do
    assert_difference('EventPhoto.count', -1) do
      delete event_photo_url(@event_photo)
    end

    assert_redirected_to event_photos_url
  end
end
