class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :value
      t.string :notes

      t.timestamps
    end
  end
end
