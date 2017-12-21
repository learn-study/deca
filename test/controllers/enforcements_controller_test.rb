require 'test_helper'

class EnforcementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enforcements_index_url
    assert_response :success
  end

end
