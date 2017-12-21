require 'test_helper'

class AltarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get altars_index_url
    assert_response :success
  end

end
