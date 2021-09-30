class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :title
      t.float :balance

      t.timestamps
    end
  end
end