require 'test_helper'

class RockStructureAssociationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rock_structure_association = rock_structure_associations(:one)
  end

  test "should get index" do
    get rock_structure_associations_url
    assert_response :success
  end

  test "should get new" do
    get new_rock_structure_association_url
    assert_response :success
  end

  test "should create rock_structure_association" do
    assert_difference('RockStructureAssociation.count') do
      post rock_structure_associations_url, params: { rock_structure_association: { outcrop_uuid: @rock_structure_association.outcrop_uuid, rock_uuid: @rock_structure_association.rock_uuid, structure_uuid: @rock_structure_association.structure_uuid, uuid: @rock_structure_association.uuid } }
    end

    assert_redirected_to rock_structure_association_url(RockStructureAssociation.last)
  end

  test "should show rock_structure_association" do
    get rock_structure_association_url(@rock_structure_association)
    assert_response :success
  end

  test "should get edit" do
    get edit_rock_structure_association_url(@rock_structure_association)
    assert_response :success
  end

  test "should update rock_structure_association" do
    patch rock_structure_association_url(@rock_structure_association), params: { rock_structure_association: { outcrop_uuid: @rock_structure_association.outcrop_uuid, rock_uuid: @rock_structure_association.rock_uuid, structure_uuid: @rock_structure_association.structure_uuid, uuid: @rock_structure_association.uuid } }
    assert_redirected_to rock_structure_association_url(@rock_structure_association)
  end

  test "should destroy rock_structure_association" do
    assert_difference('RockStructureAssociation.count', -1) do
      delete rock_structure_association_url(@rock_structure_association)
    end

    assert_redirected_to rock_structure_associations_url
  end
end
