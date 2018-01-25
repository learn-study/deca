require 'test_helper'

class BuddhistmemorialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buddhistmemorials_index_url
    assert_response :success
  end

end
