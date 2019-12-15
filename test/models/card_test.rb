require 'test_helper'

# Tests for Card model
class CardTest < ActiveSupport::TestCase
  
  # Checks if a card with valid attributes can be saved
  # Should save
  test 'should save valid card' do
    @card_fixture = cards(:one)
    card = Card.new

    card.account = @card_fixture.account
    card.card_no = @card_fixture.card_no
    card.expiry_date = @card_fixture.expiry_date
    card.cvv = @card_fixture.cvv
    card.pin = @card_fixture.pin
    card.status = @card_fixture.status
    
    card.save
    
    assert card.valid?
  end

  # Checks if a card with an invalid CVV can be saved
  # Should not save
  test 'should not save invalid cvv' do
    @card_fixture = cards(:invalid_cvv)
    card = Card.new

    card.account = @card_fixture.account
    card.card_no = @card_fixture.card_no
    card.expiry_date = @card_fixture.expiry_date
    card.cvv = @card_fixture.cvv
    card.pin = @card_fixture.pin
    card.status = @card_fixture.status
    
    card.save
    
    refute card.valid?
  end

  # Checks if a card with an invalid PIN can be saved
  # Should not save
  test 'should not save invalid pin' do
    @card_fixture = cards(:invalid_pin)
    card = Card.new

    card.account = @card_fixture.account
    card.card_no = @card_fixture.card_no
    card.expiry_date = @card_fixture.expiry_date
    card.cvv = @card_fixture.cvv
    card.pin = @card_fixture.pin
    card.status = @card_fixture.status
    
    card.save
    
    refute card.valid?
  end

  # Checks if a card with an invalid card number can be saved
  # Should not save
  test 'should not save invalid card no' do
    @card_fixture = cards(:invalid_card_no)
    card = Card.new

    card.account = @card_fixture.account
    card.card_no = @card_fixture.card_no
    card.expiry_date = @card_fixture.expiry_date
    card.cvv = @card_fixture.cvv
    card.pin = @card_fixture.pin
    card.status = @card_fixture.status
    
    card.save
    
    refute card.valid?
  end

end
