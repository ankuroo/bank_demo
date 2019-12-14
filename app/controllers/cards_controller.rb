class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy, :cancel]
  before_action :authenticate_account!

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.where(account_id: current_account.id)
  end

  # GET /cards/1
  # GET /cards/1.json
  # def show
  # end

  # GET /cards/new
  def new
    @last_card = Card.all.last
    @card = current_account.cards.build
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = current_account.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to cards_url, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(pin_params)
        format.html { redirect_to cards_url, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Cancels the selected card
  def cancel
    @card.status = false
    @card.save
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Your card has been cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:account_id, :card_no, :expiry_date, :cvv, :pin, :status)
    end

    def pin_params
      params.require(:card).permit(:pin)
    end
end
