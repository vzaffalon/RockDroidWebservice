require 'test_helper'

class RocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rock = rocks(:one)
  end

  test "should get index" do
    get rocks_url
    assert_response :success
  end

  test "should get new" do
    get new_rock_url
    assert_response :success
  end

  test "should create rock" do
    assert_difference('Rock.count') do
      post rocks_url, params: { rock: { composition: @rock.composition, degree: @rock.degree, mineralogy: @rock.mineralogy, name: @rock.name, nomenclature: @rock.nomenclature, outcrop_uuid: @rock.outcrop_uuid, size: @rock.size, texture: @rock.texture, trama: @rock.trama, type: @rock.type, uuid: @rock.uuid } }
    end

    assert_redirected_to rock_url(Rock.last)
  end

  test "should show rock" do
    get rock_url(@rock)
    assert_response :success
  end

  test "should get edit" do
    get edit_rock_url(@rock)
    assert_response :success
  end

  test "should update rock" do
    patch rock_url(@rock), params: { rock: { composition: @rock.composition, degree: @rock.degree, mineralogy: @rock.mineralogy, name: @rock.name, nomenclature: @rock.nomenclature, outcrop_uuid: @rock.outcrop_uuid, size: @rock.size, texture: @rock.texture, trama: @rock.trama, type: @rock.type, uuid: @rock.uuid } }
    assert_redirected_to rock_url(@rock)
  end

  test "should destroy rock" do
    assert_difference('Rock.count', -1) do
      delete rock_url(@rock)
    end

    assert_redirected_to rocks_url
  end
end
