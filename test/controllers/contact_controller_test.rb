require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  
  # Checks if contact page can be accessed
  # Should go to contact page
  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'h1', 'Contact Us'
  end

end
