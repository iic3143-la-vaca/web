class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :description
      t.float :lower_bound
      t.float :upper_bound
      t.boolean :dispatchable
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
