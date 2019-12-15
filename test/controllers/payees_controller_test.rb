require 'test_helper'

class PayeesControllerTest < ActionDispatch::IntegrationTest
  # Setup runs before all tests and creates an active account session
  setup do
    @payee = payees(:one)
    sign_in accounts(:one)
  end

  # Checks if user can access payees page
  # Should go to payees page
  test "should get index" do
    get payees_url
    assert_response :success
  end

  # Checks if payees can be seen without logging in
  # Should redirect to login page
  test "should not get index" do
    sign_out accounts(:one)
    get payees_url
    assert_redirected_to new_account_session_path
  end

  # Checks if user can create a new payee
  # Should go to new payee page
  test "should get new" do
    get new_payee_url
    assert_response :success
  end

  # Checks if user can access payee information
  # Should open payee info page
  test "should get show" do
    get payee_url(@payee)
    assert :success
  end

  # Checks if payee information opens when no active session
  # Should redirect to log in page
  test "should not get edit" do
    sign_out accounts(:one)
    get payee_url(@payee)
    assert_redirected_to new_account_session_path
  end

  # Checks if new payee page can be accessed without active session
  # Should redirect to sign in page
  test "should not get new" do
    sign_out accounts(:one)
    get new_payee_url
    assert_redirected_to new_account_session_path
  end

  # Checks if a payee can be created with correct parameters
  # Should create payee and redirect to payees page
  test "should create payee" do
    assert_difference('Payee.count') do
      post payees_url, params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    end

    assert_redirected_to payees_url
  end

  # Checks if payee can be created with invalid sort code
  # Should not create payee and remain on page
  test "should not create invalid sortcode payee" do
    @payee = payees(:invalid_sortcode)
    assert_difference('Payee.count',0) do
      post payees_url, params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    end

    assert_response :success
  end

  # Checks if payee can be created with invalid account number
  # Should not create payee and remain on page
  test "should not create invalid account no payee" do
    @payee = payees(:invalid_account_no)
    assert_difference('Payee.count',0) do
      post payees_url, params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    end

    assert_response :success
  end

  # Checks if user can edit payee
  # Should go to edit payee page
  test "should get edit" do
    get edit_payee_url(@payee)
    assert_response :success
  end

  # Checks if a payee can be created with correct parameters
  # Should create payee and redirect to payees page
  test "should update payee" do
    patch payee_url(@payee), params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    assert_redirected_to payees_url
  end

  # Checks if payee can be updated with invalid sort code
  # Should not update payee and remain on page
  test "should not update invalid sortcode payee" do
  @payee = payees(:invalid_sortcode)
    patch payee_url(@payee), params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    assert_response :success
  end

  # Checks if payee can be updated with invalid account number
  # Should not update payee and remain on page
  test "should not update invalid account no payee" do
    @payee = payees(:invalid_account_no)
      patch payee_url(@payee), params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
      assert_response :success
    end

  # Checks if payee can be destroyed
  # Should destroy payee and redirect to payees page
  test "should destroy payee" do
    assert_difference('Payee.count', -1) do
      delete payee_url(@payee)
    end

    assert_redirected_to payees_url
  end

  # Checks if payee can be destroyed when user not logged in
  # Should not destroy payee and redirect to log in page
  test "should not destroy payee" do
    sign_out accounts(:one)
    assert_difference('Payee.count', 0) do
      delete payee_url(@payee)
    end
    assert_redirected_to new_account_session_path
  end
end
