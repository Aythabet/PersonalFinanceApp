class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @ledgers = Ledger.all
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

  def transaction_params
    params.require(:transaction).permit(:title, :value, :notes, :ledger_id)
  end
end
