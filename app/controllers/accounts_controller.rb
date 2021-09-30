class AccountsController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find_by(title)
  end
end
