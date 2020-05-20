require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should not save message without content" do
      message = Message.new
      assert_not message.save, "Saved the message without content"
  end
end
