require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    sign_in accounts(:one)
    get cards_url
    assert_response :success
  end

  test "should not get index" do
    get cards_url
    assert_redirected_to new_account_session_path
  end

  test "should get new" do
    sign_in accounts(:one)
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    sign_in accounts(:one)
    assert_difference('Card.count') do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    end

    assert_redirected_to cards_url
  end

  test "should not create card" do
    sign_in accounts(:one)
    @card = cards(:invalid_cvv)
    assert_difference('Card.count', 0) do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }      
    end
  end

  test "should show card" do
    sign_in accounts(:one)
    get card_url(@card)
    assert_response :success
  end

  test "should cancel card" do
    sign_in accounts(:one)
    post cancel_card_url(:one)
  end

  test "should get edit" do
    sign_in accounts(:one)
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    sign_in accounts(:one)
    patch card_url(@card), params: { 
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_redirected_to cards_url
  end

  test "should not update card" do
    sign_in accounts(:one)
    @card = cards(:invalid_pin)
    patch card_url(@card), params: {
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_response :success
  end

  test "should destroy card" do
    sign_in accounts(:one)
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
