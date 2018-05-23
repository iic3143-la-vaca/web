class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :headline
      t.string :lead
      t.string :body

      t.timestamps
    end
  end
end
