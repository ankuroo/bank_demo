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

end
