require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with cookies" do
    cookies.signed[:user_id] = nil

    connect

    assert_nil connection.user_id, nil
  end
end
