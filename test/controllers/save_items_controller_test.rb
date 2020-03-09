require 'test_helper'

class SaveItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get save_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get save_items_destroy_url
    assert_response :success
  end

end
