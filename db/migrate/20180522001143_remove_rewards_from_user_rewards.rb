class RemoveRewardsFromUserRewards < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_rewards, :rewards_id
  end
end
