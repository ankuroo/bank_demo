class PayeesController < ApplicationController
  # Before actions run before any other process in an action for selected actions
  # DRYing up code
  before_action :set_payee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  # GET /payees
  # GET /payees.json
  def index
    @payees = Payee.where(account_id:  current_account.id)
  end

  # GET /payees/new
  def new
    @payee = current_account.payees.build
  end

  # GET /payees/1/edit
  def edit
  end

  # POST /payees
  # POST /payees.json
  def create
    @payee = current_account.payees.build(payee_params)

    respond_to do |format|
      if @payee.save
        format.html { redirect_to payees_path, notice: 'Payee was successfully created.' }
        format.json { render :show, status: :created, location: @payee }
      else
        format.html { render :new }
        format.json { render json: @payee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payees/1
  # PATCH/PUT /payees/1.json
  def update
    respond_to do |format|
      if @payee.update(payee_params)
        format.html { redirect_to payees_path, notice: 'Payee was successfully updated.' }
        format.json { render :show, status: :ok, location: @payee }
      else
        format.html { render :edit }
        format.json { render json: @payee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payees/1
  # DELETE /payees/1.json
  def destroy
    @payee.destroy
    respond_to do |format|
      format.html { redirect_to payees_url, notice: 'Payee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # DRY - Code to set payee for given pages.
    def set_payee
      @payee = Payee.find(params[:id])
    end

    # Parameters for payee creation and update.
    def payee_params
      params.require(:payee).permit(:account_id, :name, :account_no, :sort_code)
    end
end
