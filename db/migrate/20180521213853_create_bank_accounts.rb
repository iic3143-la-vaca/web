class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :bank
      t.string :account
      t.string :rut
      t.integer :type
      t.references :user, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
