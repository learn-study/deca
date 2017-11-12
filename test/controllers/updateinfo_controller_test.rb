require 'test_helper'

class UpdateinfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get updateinfo_index_url
    assert_response :success
  end

end
