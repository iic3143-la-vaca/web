class CreateProyects < ActiveRecord::Migration[5.1]
  def change
    create_table :proyects do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.float :goal
      t.integer :status

      t.timestamps
    end
  end
end
