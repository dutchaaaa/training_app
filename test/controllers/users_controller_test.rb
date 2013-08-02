require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @update = {
      name: 'Tom',
      email: 'tom@fake.com',
      password: 'password',
      password_confirmation: 'password',
      bench: 225,
      squat: 225,
      deadlift: 315,
      overhead_press: 135
    }
  end

  test "should get new" do
    get :new
    assert :success
  end

  test "should create product" do
    assert_difference ('User.count') do
      post :create, user: @update
    end
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, id: users(:one)
    assert_response :success
  end

  test "should get show" do
    get :show, id:users(:one)
    assert_response :success
  end

  test "should edit product" do
    patch :update, id: users(:one), user: @update
    assert_redirected_to user_path(users(:one))
  end

end
