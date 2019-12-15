class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.where(account_id: current_account.id)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = current_account.transactions.build
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = current_account.transactions.build(transaction_params)
    # Set's values for transaction balance
    @transaction.initial_bal = current_account.balance
    @transaction.final_bal = @transaction.initial_bal - @transaction.amount

    respond_to do |format|
      if @transaction.save
        # Updates the balance of the account to reflect the transfer
        current_account.balance = @transaction.final_bal
        current_account.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # DRYing the code
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Parameters for creating and updating transactions
    def transaction_params
      params.require(:transaction).permit(:account_id, :payee_id, :amount, :reference, :initial_bal, :final_bal)
    end
end
