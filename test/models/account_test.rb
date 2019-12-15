require 'test_helper'

# Tests for Account model
class AccountTest < ActiveSupport::TestCase
  
  # Checks if an account with valid attributes can be saved
  # Should save 
  test 'should save valid account' do
    @valid_account = accounts(:one)

    account = Account.new
    account = @valid_account
    
    account.save

    assert account.valid?

  end

  # Checks if an account with an invalid email can be saved
  # Should not save
  test 'should not save invalid email account' do
    @invalid = accounts(:invalid_email)

    refute Account.new(name: @invalid.name, username: @invalid.username, email: @invalid.email, balance: @invalid.balance, account_no: @invalid.account_no, sort_code: @invalid.sort_code).save
  end

  # Checks if an account with an invalid account number can be saved
  # Should not save
  test 'should not save invalid account no account' do
    @invalid = accounts(:invalid_account_no)

    refute Account.new(name: @invalid.name, username: @invalid.username, email: @invalid.email, balance: @invalid.balance, account_no: @invalid.account_no, sort_code: @invalid.sort_code).save
  end

  # Checks if an account with an invalid sort code can be saved
  # Should not save
  test 'should not save invalid sort code account' do
    @invalid = accounts(:invalid_sortcode)

    refute Account.new(name: @invalid.name, username: @invalid.username, email: @invalid.email, balance: @invalid.balance, account_no: @invalid.account_no, sort_code: @invalid.sort_code).save
  end
  
end
