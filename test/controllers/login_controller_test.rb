require 'test_helper'

class LoginControllerTest < ActionController::TestCase

  setup do
        @new_user = {
      name: 'Tom',
      email: 'tom@fake.com',
      password: 'password',
      password_confirmation: 'password',
      bench: 225,
      squat: 225,
      deadlift: 315,
      overhead_press: 135
    }
    @test_user = User.create(@new_user)
  end

  test "should get login" do 
    get :new_session
    assert :success
  end

  test "should create new session" do
    skip
    post :create_session, email: users(:one).email, password: users(:one).password
    assert_equal session[:user_id], users(:one).id

    assert_redirected_to user_path(users(:one))
  end 

  test "should logout" do
    session[:user_id] = users(:one).id
    post :end_session, id: users(:one).id
    assert_nil session[:user_id]
  end
    
end
