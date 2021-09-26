class AccountsController
  def index
    @accounts = Account.all
  end

  def show
    @transaction = Transaction.find(params[:id])
    @account = Account.find_by(id: @transaction.account_id)
  end
end
