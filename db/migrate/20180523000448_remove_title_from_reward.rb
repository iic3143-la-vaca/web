class RemoveTitleFromReward < ActiveRecord::Migration[5.2]
  def change
    remove_column :rewards, :title
  end
end
