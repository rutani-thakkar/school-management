require "test_helper"

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get schools_new_url
    assert_response :success
  end

  test "should get create" do
    get schools_create_url
    assert_response :success
  end

  test "should get edit" do
    get schools_edit_url
    assert_response :success
  end

  test "should get update" do
    get schools_update_url
    assert_response :success
  end

  test "should get delete" do
    get schools_delete_url
    assert_response :success
  end

  test "should get show" do
    get schools_show_url
    assert_response :success
  end
end
