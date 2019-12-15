require 'test_helper'

# Tests for Payee Model
class PayeeTest < ActiveSupport::TestCase

  # Checks if a payee with valid attributes can be saved
  # Should save
  test 'should save valid payee' do
    @payee_fixture = payees(:one)
    payee = Payee.new

    payee.account = @payee_fixture.account
    payee.name = @payee_fixture.name
    payee.account_no = @payee_fixture.account_no
    payee.sort_code = @payee_fixture.sort_code
    
    assert payee.valid?
  end

  # Checks if a payee with an invalid sortcode can be saved
  # Should not save
  test 'should not save invalid sortcode payee' do
    @payee_fixture = payees(:invalid_sortcode)
    payee = Payee.new

    payee.account = @payee_fixture.account
    payee.name = @payee_fixture.name
    payee.account_no = @payee_fixture.account_no
    payee.sort_code = @payee_fixture.sort_code
    
    refute payee.valid?
  end

  # Checks if a payee with an invalid account number can be saved
  # Should not save
  test 'should not save invalid account number payee' do
    @payee_fixture = payees(:invalid_account_no)
    payee = Payee.new

    payee.account = @payee_fixture.account
    payee.name = @payee_fixture.name
    payee.account_no = @payee_fixture.account_no
    payee.sort_code = @payee_fixture.sort_code
    
    refute payee.valid?
  end

end
