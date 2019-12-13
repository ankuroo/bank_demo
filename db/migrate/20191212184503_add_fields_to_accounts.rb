class AddFieldsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :username, :string, unique: true
    add_column :accounts, :balance, :float
    add_column :accounts, :account_no, :string, unique: true
    add_column :accounts, :sort_code, :string
  end
end
