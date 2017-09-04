require 'test_helper'

class StructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @structure = structures(:one)
  end

  test "should get index" do
    get structures_url
    assert_response :success
  end

  test "should get new" do
    get new_structure_url
    assert_response :success
  end

  test "should create structure" do
    assert_difference('Structure.count') do
      post structures_url, params: { structure: { description: @structure.description, dip: @structure.dip, dip_direction: @structure.dip_direction, name: @structure.name, outcrop_uuid: @structure.outcrop_uuid, phase: @structure.phase, type: @structure.type, uuid: @structure.uuid } }
    end

    assert_redirected_to structure_url(Structure.last)
  end

  test "should show structure" do
    get structure_url(@structure)
    assert_response :success
  end

  test "should get edit" do
    get edit_structure_url(@structure)
    assert_response :success
  end

  test "should update structure" do
    patch structure_url(@structure), params: { structure: { description: @structure.description, dip: @structure.dip, dip_direction: @structure.dip_direction, name: @structure.name, outcrop_uuid: @structure.outcrop_uuid, phase: @structure.phase, type: @structure.type, uuid: @structure.uuid } }
    assert_redirected_to structure_url(@structure)
  end

  test "should destroy structure" do
    assert_difference('Structure.count', -1) do
      delete structure_url(@structure)
    end

    assert_redirected_to structures_url
  end
end
