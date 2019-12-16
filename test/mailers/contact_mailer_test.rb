require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  
  # Checks if email sent and returns preview
  test "should return contact email" do
    mail = ContactMailer.contact_email("Claude Van Rees", "claude.v.ress@mail.com", @message = "Hello")
    assert_equal ['admin@csb.com'], mail.to
    assert_equal ['sender@mail.com'], mail.from
  end

end
