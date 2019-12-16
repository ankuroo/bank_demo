require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  
  # Checks if user can access login page
  test "should get home page" do
    get root_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'p', 'Join now and get £500 free.'

    assert_select 'h1', 'Disclaimer'
  end

  # Checks if user can access contact page
  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select'h1', 'Contact Us'
  end

  # Checks if the post can be sent
  test "should post request contact" do
    post request_contact_url, params:
    {name: "Maya Doustos", email: "mayad@mail.com", message: "Hello"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

  # Checks if message can be sent without email
  test "should post request contact but no email" do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

end
