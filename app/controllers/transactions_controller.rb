class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    total_balance
    total_balance_bank
    total_balance_cash
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    redirect_to root_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:title, :value, :notes, :account_id)
  end

  def total_balance
    @totalBalance = 0
    @transactions.each do |transaction|
      @totalBalance += transaction.value
    end
  end

  def total_balance_bank
    @totalBalanceBank = 0
    @transactions.each do |transaction|
      if transaction.account == "Bank"
        @totalBalanceBank += transaction.value
      end
    end
  end

  def total_balance_cash
    @totalBalanceCash = 0
    @transactions.each do |transaction|
      if transaction.account == "Cash"
        @totalBalanceCash += transaction.value
      end
    end
  end
end
