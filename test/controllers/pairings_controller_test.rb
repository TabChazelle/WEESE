require "test_helper"

class PairingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pairings_new_url
    assert_response :success
  end

  test "should get create" do
    get pairings_create_url
    assert_response :success
  end

  test "should get index" do
    get pairings_index_url
    assert_response :success
  end

  test "should get show" do
    get pairings_show_url
    assert_response :success
  end
end
