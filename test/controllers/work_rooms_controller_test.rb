require 'test_helper'

class WorkRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get work_rooms_new_url
    assert_response :success
  end

  test "should get show" do
    get work_rooms_show_url
    assert_response :success
  end

  test "should get edit" do
    get work_rooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get work_rooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get work_rooms_destroy_url
    assert_response :success
  end

  test "should get index" do
    get work_rooms_index_url
    assert_response :success
  end

  test "should get index_new" do
    get work_rooms_index_new_url
    assert_response :success
  end

  test "should get index_reccomend" do
    get work_rooms_index_reccomend_url
    assert_response :success
  end

  test "should get search" do
    get work_rooms_search_url
    assert_response :success
  end

end
