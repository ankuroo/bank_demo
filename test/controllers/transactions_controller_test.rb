require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in accounts(:one)
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should not get index" do
    sign_out accounts(:one)
    get transactions_url
    assert_redirected_to new_account_session_url
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should not get new" do
    sign_out accounts(:one)
    get new_transaction_url
    assert_redirected_to new_account_session_url
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should not create transaction" do
  @transaction = transactions(:invalid_payee)
    assert_difference('Transaction.count', 0) do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    end

    assert_response :success
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should not show transaction" do
    sign_out accounts(:one)
    get transaction_url(@transaction)
    assert_redirected_to new_account_session_url
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should not update transaction" do
    sign_out accounts(:one)
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    assert_redirected_to new_account_session_url
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end

  test "should not destroy transaction" do
    sign_out accounts(:one)
    assert_difference('Transaction.count', 0) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to new_account_session_url
  end

end
