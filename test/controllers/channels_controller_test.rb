require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_session_url
    assert_response :success
  end

end
