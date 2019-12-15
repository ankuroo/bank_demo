require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  # Setup runs before all tests and creates an active account session
  setup do
    sign_in accounts(:one)
    @card = cards(:one)
  end

  # Checks if cards can be displayed
  # Should show cards page
  test "should get index" do
    get cards_url
    assert_response :success
  end

  # Checks if cards are shown when no user logged in.
  # Should redirect to login page 
  test "should not get index" do
    sign_out accounts(:one)
    get cards_url
    assert_redirected_to new_account_session_path
  end

  # Checks if user can request a new card
  # Should go to new card creation page
  test "should get new" do
    get new_card_url
    assert_response :success
  end

  # Checks if user can cancel card
  # SHould cancel card and redirect to cards page
  test "should cancel card" do
    post cancel_card_url(@card)
    assert_redirected_to cards_url
  end

  # Checks if user can cancel card when user not logged in
  # Should redirect to log in page
  test "should not cancel card" do
    sign_out accounts(:one)
    post cancel_card_url(@card)
    assert_redirected_to new_account_session_path
  end

  # Checks if card can be requested when user not logged in
  # Should redirect to log in page 
  test "should not get new" do
    sign_out accounts(:one)
    get new_card_url
    assert_redirected_to new_account_session_path
  end

  # Checks if card can be created with correct inputs
  # Should create card and redirect to cards page
  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    end

    assert_redirected_to cards_url
  end

  # Checks if card can be created with an invalid CVV
  # Should remain on page and not create card
  test "should not create invalid cvv card" do
    @card = cards(:invalid_cvv)
    assert_difference('Card.count', 0) do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }      
    end

    assert_response :success
  end

  # Checks if card can be created with an invalid PIN
  # Should remain on page and not create card
  test "should not create invalid pin card" do
    @card = cards(:invalid_pin)
    assert_difference('Card.count', 0) do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }      
    end
    assert_response :success
  end

  # Checks if card can be created with an invalid card number
  # Should remain on page and not create card
  test "should not create invalid card no card" do
    @card = cards(:invalid_card_no)
    assert_difference('Card.count', 0) do
      post cards_url, params: { card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }      
    end
    assert_response :success
  end

  # Checks if user can edit card details
  # Should go to edit PIN page
  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  # Checks if card pin can be edited when no session is active
  # Should redirect to login page
  test "should not get edit" do
    sign_out accounts(:one)
    get edit_card_url(@card)
    assert_redirected_to new_account_session_path
  end

  # Checks if card can be updated with valid updates
  # Should redirect to cards page
  test "should update card" do
    patch card_url(@card), params: { 
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_redirected_to cards_url
  end

  # Checks if card can be updated with an invalid PIN
  # Should remain on page and not update card
  test "should not update invalid pin card" do
    @card = cards(:invalid_pin)
    patch card_url(@card), params: {
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_response :success
  end

  # Checks if card can be updated with an invalid CVV
  # Should remain on page and not update card
  test "should not update invalid cvv card" do
    @card = cards(:invalid_cvv)
    patch card_url(@card), params: {
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_response :success
  end

  # Checks if card can be updated with an invalid account number
  # Should remain on page and not update card
  test "should not update invalid card no card" do
    @card = cards(:invalid_card_no)
    patch card_url(@card), params: {
      card: { account_id: @card.account_id, card_no: @card.card_no, cvv: @card.cvv, expiry_date: @card.expiry_date, pin: @card.pin, status: @card.status } }
    assert_response :success
  end

  # Checks if user can destroy card
  # Should destroy card and redirect to cards page
  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end

  # Checks if card can be destroyed when user not logged in
  # Should not destroy card and remain on page
  test "should not destroy card" do
    sign_out accounts(:one)
    assert_difference('Card.count', 0) do
      delete card_url(@card)
    end
    assert_redirected_to new_account_session_path
  end

end