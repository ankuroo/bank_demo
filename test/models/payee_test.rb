require 'test_helper'

class PayeeTest < ActiveSupport::TestCase

  test 'should save valid payee' do
    @payee_fixture = payees(:one)
    payee = Payee.new

    payee.account = @payee_fixture.account
    payee.name = @payee_fixture.name
    payee.account_no = @payee_fixture.account_no
    payee.sort_code = @payee_fixture.sort_code
    
    assert payee.valid?
  end

  test 'should not save valid payee' do
    @payee_fixture = payees(:invalid_sortcode)
    payee = Payee.new

    payee.account = @payee_fixture.account
    payee.name = @payee_fixture.name
    payee.account_no = @payee_fixture.account_no
    payee.sort_code = @payee_fixture.sort_code
    
    refute payee.valid?
  end

end
