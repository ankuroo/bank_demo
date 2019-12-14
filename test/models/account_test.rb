require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  
  test 'should save valid account' do
    @valid_account = accounts(:one)

    account = Account.new
    account = @valid_account
    
    account.save

    assert account.valid?

  end
  
end
