require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get replies_index_url
    assert_response :success
  end

end
