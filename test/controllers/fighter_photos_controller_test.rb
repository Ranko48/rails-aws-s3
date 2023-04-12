require "test_helper"

class FighterPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fighter_photo = fighter_photos(:one)
  end

  test "should get index" do
    get fighter_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_fighter_photo_url
    assert_response :success
  end

  test "should create fighter_photo" do
    assert_difference('FighterPhoto.count') do
      post fighter_photos_url, params: { fighter_photo: {  } }
    end

    assert_redirected_to fighter_photo_url(FighterPhoto.last)
  end

  test "should show fighter_photo" do
    get fighter_photo_url(@fighter_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_fighter_photo_url(@fighter_photo)
    assert_response :success
  end

  test "should update fighter_photo" do
    patch fighter_photo_url(@fighter_photo), params: { fighter_photo: {  } }
    assert_redirected_to fighter_photo_url(@fighter_photo)
  end

  test "should destroy fighter_photo" do
    assert_difference('FighterPhoto.count', -1) do
      delete fighter_photo_url(@fighter_photo)
    end

    assert_redirected_to fighter_photos_url
  end
end
