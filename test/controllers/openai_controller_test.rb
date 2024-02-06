require "test_helper"

class OpenaiControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get openai_test_url
    assert_response :success
  end
end
