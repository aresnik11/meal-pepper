require 'test_helper'

class GroceriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get groceries_index_url
    assert_response :success
  end

end
