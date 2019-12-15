require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  
  # Setup runs before all tests and creates an active account session
  setup do
    sign_in accounts(:one)
    @transaction = transactions(:one)
  end

  # Checks if transactions can be displayed
  # Should show transactions page
  test "should get index" do
    get transactions_url
    assert_response :success
  end

  # Checks if transactions can be displayed when user not logged in
  # Should redirect to sign in page
  test "should not get index" do
    sign_out accounts(:one)
    get transactions_url
    assert_redirected_to new_account_session_url
  end

  # Checks if user can make a transaction
  # Should go to new transaction page
  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  # Checks if new transaction page can be accessed when no active session
  # Should redirect to sign in page
  test "should not get new" do
    sign_out accounts(:one)
    get new_transaction_url
    assert_redirected_to new_account_session_url
  end

  # Checks if transaction can be made with valid parameters
  # Should create transaction and redirect to transactions page
  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  # Checks if transaction can be created with invalid payee
  # Should not create transaction and redirect to sign in page
  test "should not create invalid payee transaction" do
  @transaction = transactions(:invalid_payee)
    assert_difference('Transaction.count', 0) do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    end

    assert_response :success
  end

  # Checks if transaction can be created with incorrect amount
  # Should not create transaction and redirect to sign in page
  test "should not create invalid amount transaction" do
    @transaction = transactions(:invalid_amount)
      assert_difference('Transaction.count', 0) do
        post transactions_url, params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
      end
  
    assert_response :success
  end

  # Checks if you can see transaction details
  # Should go to transaction page
  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  # Checks if transaction can be accessed when no active session
  # Should redirect to sign in page
  test "should not show transaction" do
    sign_out accounts(:one)
    get transaction_url(@transaction)
    assert_redirected_to new_account_session_url
  end

  # Checks if transaction can be updated with correct inputs
  # Should update transaction and redirect to transactions page
  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    assert_redirected_to transaction_url(@transaction)
  end

  # Checks if transaction can be updated when no active session
  # Should not update transaction and redirect to sign in page
  test "should not update transaction" do
    sign_out accounts(:one)
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    assert_redirected_to new_account_session_url
  end

  # Checks if transaction can be updated with incorrect payee
  # Should not update transaction and remain on page
  test "should not update invalid payee transaction" do
    @transaction = transactions(:invalid_payee)
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    assert :success
  end

  # Checks if transaction can be updated with incorrect amount
  # Should not update transaction and remain on page
  test "should not update invalid amount transaction" do
    @transaction = transactions(:invalid_amount)
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, final_bal: @transaction.final_bal, initial_bal: @transaction.initial_bal, payee_id: @transaction.payee_id, reference: @transaction.reference } }
    assert :success
  end

  # Checks if transaction can be destroyed 
  # Should destroy transaction and redirect to transactions page
  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end

  # Checks if transaction can be destroyed when no active session 
  # Should not destroy transaction and redirect to sign in page
  test "should not destroy transaction" do
    sign_out accounts(:one)
    assert_difference('Transaction.count', 0) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to new_account_session_url
  end

end
