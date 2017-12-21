require 'test_helper'

class CostlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get costlists_index_url
    assert_response :success
  end

end
