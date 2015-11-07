class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]


  # GET /account/1/deposit
  def deposit
    @account = Account.find params[:id]
    @transaction = @account.transactions.build( :sign => 1 )
  end

  # GET /account/1/extract
  def extract
    @account = Account.find params[:id]
    @transaction = @account.transactions.build( :sign => -1 )
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    @transaction.amount = @transaction.amount * @transaction.sign.to_i

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction.account, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction.account }
      else
        format.html { render :deposit }
        format.json { render json: @transaction.account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :account_id, :note, :sign)
    end
end
