class AddTitleToReward < ActiveRecord::Migration[5.2]
  def change
    add_column :rewards, :title, :string
  end
end
