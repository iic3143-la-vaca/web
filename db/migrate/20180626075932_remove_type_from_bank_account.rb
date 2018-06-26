class RemoveTypeFromBankAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :bank_accounts, :type
  end
end
