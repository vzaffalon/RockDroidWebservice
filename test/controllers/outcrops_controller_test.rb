require 'test_helper'

class OutcropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outcrop = outcrops(:one)
  end

  test "should get index" do
    get outcrops_url
    assert_response :success
  end

  test "should get new" do
    get new_outcrop_url
    assert_response :success
  end

  test "should create outcrop" do
    assert_difference('Outcrop.count') do
      post outcrops_url, params: { outcrop: { altitude: @outcrop.altitude, date_time: @outcrop.date_time, description: @outcrop.description, horizontal_datum: @outcrop.horizontal_datum, latitude: @outcrop.latitude, longitude: @outcrop.longitude, name: @outcrop.name, stage_uuid: @outcrop.stage_uuid, toponomy: @outcrop.toponomy, uuid: @outcrop.uuid } }
    end

    assert_redirected_to outcrop_url(Outcrop.last)
  end

  test "should show outcrop" do
    get outcrop_url(@outcrop)
    assert_response :success
  end

  test "should get edit" do
    get edit_outcrop_url(@outcrop)
    assert_response :success
  end

  test "should update outcrop" do
    patch outcrop_url(@outcrop), params: { outcrop: { altitude: @outcrop.altitude, date_time: @outcrop.date_time, description: @outcrop.description, horizontal_datum: @outcrop.horizontal_datum, latitude: @outcrop.latitude, longitude: @outcrop.longitude, name: @outcrop.name, stage_uuid: @outcrop.stage_uuid, toponomy: @outcrop.toponomy, uuid: @outcrop.uuid } }
    assert_redirected_to outcrop_url(@outcrop)
  end

  test "should destroy outcrop" do
    assert_difference('Outcrop.count', -1) do
      delete outcrop_url(@outcrop)
    end

    assert_redirected_to outcrops_url
  end
end
