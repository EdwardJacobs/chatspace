require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'ed@gmail.com', password: 'testtest')
  end
  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test 'invalid without password' do
    @user.password = nil
    refute @user.valid? 'saved user without a password'
    assert_not_nil @user.errors[:password], 'no validation error for password present'
  end
end
