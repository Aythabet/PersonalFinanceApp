class DropTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :accounts
    drop_table :transactions
  end
end
