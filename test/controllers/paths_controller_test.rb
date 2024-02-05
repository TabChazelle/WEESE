require "test_helper"

class PathsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paths_index_url
    assert_response :success
  end
end
