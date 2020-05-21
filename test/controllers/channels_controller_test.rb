require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get channel_path :id
    assert_response :success
  end

end
