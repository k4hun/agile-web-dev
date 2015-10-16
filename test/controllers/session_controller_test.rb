require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    bartek = users(:one)
    post :create, name: bartek.name, password: 'secret'
    assert_redirected_to admin_path
    assert_equal bartek.id, session[:user_id]
  end
  
  test "should fail login" do
    bartek = users(:one)
    post :create, name: bartek.name, password: 'wrong'
    assert_redirected_to login_path
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_path
    assert_equal nil, session[:user_id]
  end

end
