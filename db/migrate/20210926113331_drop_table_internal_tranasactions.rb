class DropTableInternalTranasactions < ActiveRecord::Migration[6.1]
  def change
    drop_table :internal_transactions
  end
end
