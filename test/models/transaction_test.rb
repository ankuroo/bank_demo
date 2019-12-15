require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save valid transaction' do
    @transaction_fixture = transactions(:one)
    transaction = Transaction.new

    transaction.account = @transaction_fixture.account
    transaction.payee = @transaction_fixture.payee
    transaction.amount = @transaction_fixture.amount
    transaction.reference = @transaction_fixture.reference
    transaction.initial_bal = @transaction_fixture.initial_bal
    transaction.final_bal = @transaction_fixture.final_bal

    transaction.save

    assert transaction.valid?

  end

  test 'should not save invalid transaction' do
    @transaction_fixture = transactions(:invalid_payee)
    transaction = Transaction.new

    transaction.account = @transaction_fixture.account
    transaction.payee = @transaction_fixture.payee
    transaction.amount = @transaction_fixture.amount
    transaction.reference = @transaction_fixture.reference
    transaction.initial_bal = @transaction_fixture.initial_bal
    transaction.final_bal = @transaction_fixture.final_bal

    transaction.save

    refute transaction.valid?

  end

end
