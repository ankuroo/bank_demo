ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers
  
  def log_in( account )
    get '/accounts/sign_in'
    if integration_test?
      login_as(account, :scope => :account)
    else
      sign_in( user )
    end
  end

end
