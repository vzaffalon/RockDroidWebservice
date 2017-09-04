require 'test_helper'

class OutcropPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outcrop_photo = outcrop_photos(:one)
  end

  test "should get index" do
    get outcrop_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_outcrop_photo_url
    assert_response :success
  end

  test "should create outcrop_photo" do
    assert_difference('OutcropPhoto.count') do
      post outcrop_photos_url, params: { outcrop_photo: { base64image: @outcrop_photo.base64image, filename: @outcrop_photo.filename, outcrop_uuid: @outcrop_photo.outcrop_uuid, uuid: @outcrop_photo.uuid } }
    end

    assert_redirected_to outcrop_photo_url(OutcropPhoto.last)
  end

  test "should show outcrop_photo" do
    get outcrop_photo_url(@outcrop_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_outcrop_photo_url(@outcrop_photo)
    assert_response :success
  end

  test "should update outcrop_photo" do
    patch outcrop_photo_url(@outcrop_photo), params: { outcrop_photo: { base64image: @outcrop_photo.base64image, filename: @outcrop_photo.filename, outcrop_uuid: @outcrop_photo.outcrop_uuid, uuid: @outcrop_photo.uuid } }
    assert_redirected_to outcrop_photo_url(@outcrop_photo)
  end

  test "should destroy outcrop_photo" do
    assert_difference('OutcropPhoto.count', -1) do
      delete outcrop_photo_url(@outcrop_photo)
    end

    assert_redirected_to outcrop_photos_url
  end
end
