require 'test_helper'

class SamplePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sample_photo = sample_photos(:one)
  end

  test "should get index" do
    get sample_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_sample_photo_url
    assert_response :success
  end

  test "should create sample_photo" do
    assert_difference('SamplePhoto.count') do
      post sample_photos_url, params: { sample_photo: { base64image: @sample_photo.base64image, filename: @sample_photo.filename, sample_uuid: @sample_photo.sample_uuid, uuid: @sample_photo.uuid } }
    end

    assert_redirected_to sample_photo_url(SamplePhoto.last)
  end

  test "should show sample_photo" do
    get sample_photo_url(@sample_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_sample_photo_url(@sample_photo)
    assert_response :success
  end

  test "should update sample_photo" do
    patch sample_photo_url(@sample_photo), params: { sample_photo: { base64image: @sample_photo.base64image, filename: @sample_photo.filename, sample_uuid: @sample_photo.sample_uuid, uuid: @sample_photo.uuid } }
    assert_redirected_to sample_photo_url(@sample_photo)
  end

  test "should destroy sample_photo" do
    assert_difference('SamplePhoto.count', -1) do
      delete sample_photo_url(@sample_photo)
    end

    assert_redirected_to sample_photos_url
  end
end
