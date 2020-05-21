require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
    include ActionCable::TestHelper

    test "connects with devise" do
      user = users(:admin)
      connect_with_user(user)
      assert_equal connection.current_user, user
    end

    private

    def connect_with_user(user)
      connect env: { 'warden' => FakeEnv.new(user) }
    end

    class FakeEnv
      attr_reader :user

      def initialize(user)
        @user = user
      end
    end
end
