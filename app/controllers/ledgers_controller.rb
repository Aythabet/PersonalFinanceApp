class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.all
  end

  def new
    @ledger = Ledger.new
  end

  def create
    @ledger = Ledger.new(ledger_params)

    if @ledger.save
      redirect_to @ledger
    else
      render :new
    end
  end

  def show
    @ledger = Ledger.find(params[:id])
  end

  def edit
    @ledger = Ledger.find(params[:id])
  end

  def update
    @ledger = Ledger.find(params[:id])

    if @ledger.update(ledger_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @ledger = Ledger.find(params[:id])
    @ledger.destroy

    redirect_to root_path
  end

  private

  def ledger_params
    params.require(:ledger).permit(:title, :balance)
  end
end
