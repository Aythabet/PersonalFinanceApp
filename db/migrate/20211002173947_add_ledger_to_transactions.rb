class AddLedgerToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :ledger, foreign_key: true
  end
end
