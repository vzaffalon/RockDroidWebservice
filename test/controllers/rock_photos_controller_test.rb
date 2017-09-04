require 'test_helper'

class RockPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rock_photo = rock_photos(:one)
  end

  test "should get index" do
    get rock_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_rock_photo_url
    assert_response :success
  end

  test "should create rock_photo" do
    assert_difference('RockPhoto.count') do
      post rock_photos_url, params: { rock_photo: { base64image: @rock_photo.base64image, filename: @rock_photo.filename, rock_uuid: @rock_photo.rock_uuid, uuid: @rock_photo.uuid } }
    end

    assert_redirected_to rock_photo_url(RockPhoto.last)
  end

  test "should show rock_photo" do
    get rock_photo_url(@rock_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_rock_photo_url(@rock_photo)
    assert_response :success
  end

  test "should update rock_photo" do
    patch rock_photo_url(@rock_photo), params: { rock_photo: { base64image: @rock_photo.base64image, filename: @rock_photo.filename, rock_uuid: @rock_photo.rock_uuid, uuid: @rock_photo.uuid } }
    assert_redirected_to rock_photo_url(@rock_photo)
  end

  test "should destroy rock_photo" do
    assert_difference('RockPhoto.count', -1) do
      delete rock_photo_url(@rock_photo)
    end

    assert_redirected_to rock_photos_url
  end
end
