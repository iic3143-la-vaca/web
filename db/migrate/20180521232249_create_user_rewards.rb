class CreateUserRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rewards do |t|
      t.references :user, foreign_key: true
      t.references :rewards, foreign_key: true

      t.timestamps
    end
  end
end
