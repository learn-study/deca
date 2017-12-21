require 'test_helper'

class ProfitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profits_index_url
    assert_response :success
  end

end
