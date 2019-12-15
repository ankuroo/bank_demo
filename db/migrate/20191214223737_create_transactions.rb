class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :account, foreign_key: true
      t.belongs_to :payee, foreign_key: true
      t.float :amount
      t.string :reference
      t.float :initial_bal
      t.float :final_bal

      t.timestamps
    end
  end
end
