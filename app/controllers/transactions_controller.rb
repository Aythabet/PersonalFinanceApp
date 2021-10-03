class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @ledgers = Ledger.all
    ledger_balance
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to root_path
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

  def ledger_balance
    @ledgers.each do |ledger|
      if ledger.balance == 0
        ledger.balance = ledger.transactions.sum(:value)
        ledger.save
      end
    end
  end

  def transaction_params
    params.require(:transaction).permit(:title, :value, :notes, :ledger_id)
  end
end
