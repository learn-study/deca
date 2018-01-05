require 'test_helper'

class TemplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get temples_index_url
    assert_response :success
  end

end
