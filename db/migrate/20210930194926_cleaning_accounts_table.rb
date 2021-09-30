class CleaningAccountsTable < ActiveRecord::Migration[6.1]
  def change
    remove_index :transactions, name: "index_transactions_on_account_id"
    remove_foreign_key :transactions, :accounts
    remove_column :transactions, :account_id, :integer
  end
end
