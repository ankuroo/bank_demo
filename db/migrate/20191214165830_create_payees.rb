class CreatePayees < ActiveRecord::Migration[5.2]
  def change
    create_table :payees do |t|
      t.belongs_to :account, foreign_key: true
      t.string :name
      t.string :account_no
      t.string :sort_code

      t.timestamps
    end
  end
end
