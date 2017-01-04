require 'test_helper'

class RoleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_type = role_types(:one)
  end

  test "should get index" do
    get role_types_url, as: :json
    assert_response :success
  end

  test "should create role_type" do
    assert_difference('RoleType.count') do
      post role_types_url, params: { role_type: { department_id: @role_type.department_id, name: @role_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show role_type" do
    get role_type_url(@role_type), as: :json
    assert_response :success
  end

  test "should update role_type" do
    patch role_type_url(@role_type), params: { role_type: { department_id: @role_type.department_id, name: @role_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy role_type" do
    assert_difference('RoleType.count', -1) do
      delete role_type_url(@role_type), as: :json
    end

    assert_response 204
  end
end
