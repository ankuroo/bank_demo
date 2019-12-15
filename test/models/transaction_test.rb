require 'test_helper'

# Tests for Transaction model
class TransactionTest < ActiveSupport::TestCase

  # Checks if a transaction with valid attributes can be saved
  # Should save
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

  # Checks if a transaction with an invalid payee can be saved
  # Should not save
  test 'should not save invalid payee transaction' do
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

  # Checks if a transaction with an invalid amount can be saved
  # Should not save
  test 'should not save invalid amount' do
    @transaction_fixture = transactions(:invalid_amount)
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
