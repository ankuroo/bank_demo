class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.belongs_to :account, foreign_key: true
      t.string :card_no
      t.date :expiry_date
      t.string :cvv
      t.string :pin
      t.boolean :status

      t.timestamps
    end
  end
end
