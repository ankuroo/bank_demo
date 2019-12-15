require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in accounts(:one)
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should not get index" do
    sign_out accounts(:one)
    get cards_url
    assert_redirected_to new_account_session_path
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    end

    assert_redirected_to cards_url
  end

  test "should not create card" do
    @card = cards(:invalid_cvv)
    assert_difference('Card.count', 0) do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }      
    end
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should not get edit" do
    sign_out accounts(:one)
    get edit_card_url(@card)
    assert_redirected_to new_account_session_path
  end

  test "should update card" do
    patch card_url(@card), params: { 
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_redirected_to cards_url
  end

  test "should not update card" do
    @card = cards(:invalid_pin)
    patch card_url(@card), params: {
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_response :success
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end

  test "should not destroy card" do
    sign_out accounts(:one)
    assert_difference('Card.count', 0) do
      delete card_url(@card)
    end
    assert_redirected_to new_account_session_path
  end

end
