require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @invalid_user = { 
      name: nil,
      email: nil,
      password: nil,
      bench: nil,
      squat: nil,
      deadlift: nil,
      overhead_press: nil
    }
  end

  test "User information shouldn't be blank" do 
    @user = User.create(@invalid_user)
    assert @user.invalid?
  end
end
