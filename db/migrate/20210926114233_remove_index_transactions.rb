class RemoveIndexTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_index :transactions, name: "index_transactions_on_notes"
  end
end
