require 'test_helper'

class CardTest < ActiveSupport::TestCase
  

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

  test 'should not save invalid card' do
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

end
