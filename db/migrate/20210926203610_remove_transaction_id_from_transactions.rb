class RemoveTransactionIdFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :transaction_id, :integer
  end
end
