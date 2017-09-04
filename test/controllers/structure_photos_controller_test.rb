require 'test_helper'

class StructurePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @structure_photo = structure_photos(:one)
  end

  test "should get index" do
    get structure_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_structure_photo_url
    assert_response :success
  end

  test "should create structure_photo" do
    assert_difference('StructurePhoto.count') do
      post structure_photos_url, params: { structure_photo: { base64image: @structure_photo.base64image, filename: @structure_photo.filename, uuid: @structure_photo.uuid } }
    end

    assert_redirected_to structure_photo_url(StructurePhoto.last)
  end

  test "should show structure_photo" do
    get structure_photo_url(@structure_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_structure_photo_url(@structure_photo)
    assert_response :success
  end

  test "should update structure_photo" do
    patch structure_photo_url(@structure_photo), params: { structure_photo: { base64image: @structure_photo.base64image, filename: @structure_photo.filename, uuid: @structure_photo.uuid } }
    assert_redirected_to structure_photo_url(@structure_photo)
  end

  test "should destroy structure_photo" do
    assert_difference('StructurePhoto.count', -1) do
      delete structure_photo_url(@structure_photo)
    end

    assert_redirected_to structure_photos_url
  end
end
