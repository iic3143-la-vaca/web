class AddFinancingDescriptionToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :financing_description, :text
  end
end
