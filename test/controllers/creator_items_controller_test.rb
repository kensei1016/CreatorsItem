require 'test_helper'

class CreatorItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get creator_items_show_url
    assert_response :success
  end

end
