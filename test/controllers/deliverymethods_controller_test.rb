require 'test_helper'

class DeliverymethodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deliverymethods_index_url
    assert_response :success
  end

end
