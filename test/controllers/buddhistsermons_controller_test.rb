require 'test_helper'

class BuddhistsermonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buddhistsermons_index_url
    assert_response :success
  end

end
