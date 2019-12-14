require 'test_helper'

class PayeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payee = payees(:one)
    sign_in accounts(:one)
  end

  test "should get index" do
    get payees_url
    assert_response :success
  end

  test "should not get index" do
    sign_out accounts(:one)
    get payees_url
    assert_redirected_to new_account_session_path
  end

  test "should get new" do
    get new_payee_url
    assert_response :success
  end

  test "should create payee" do
    assert_difference('Payee.count') do
      post payees_url, params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    end

    assert_redirected_to payees_url
  end

  test "should not create new payee" do
    @payee = payees(:invalid_sortcode)
    assert_difference('Payee.count',0) do
      post payees_url, params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    end

    assert_response :success
  end

  test "should get edit" do
    get edit_payee_url(@payee)
    assert_response :success
  end

  test "should update payee" do
    patch payee_url(@payee), params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    assert_redirected_to payees_url
  end

  test "should not update payee" do
  @payee = payees(:invalid_sortcode)
    patch payee_url(@payee), params: { payee: { account_id: @payee.account_id, account_no: @payee.account_no, name: @payee.name, sort_code: @payee.sort_code } }
    assert_response :success
  end

  test "should destroy payee" do
    assert_difference('Payee.count', -1) do
      delete payee_url(@payee)
    end

    assert_redirected_to payees_url
  end
end
