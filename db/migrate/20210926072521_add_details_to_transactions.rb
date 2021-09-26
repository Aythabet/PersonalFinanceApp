class AddDetailsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :notes, :string
    add_index :transactions, :notes
    add_column :transactions, :account, :string
  end
end
