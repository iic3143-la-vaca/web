class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :tag
      t.integer :color

      t.timestamps
    end
  end
end
