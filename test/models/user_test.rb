require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'ed@gmail.com')
  end
  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do

  end

  test 'invalid without email' do

  end
end
