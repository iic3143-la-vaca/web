class CreateProyectTags < ActiveRecord::Migration[5.1]
  def change
    create_table :proyect_tags do |t|
      t.references :tag, foreign_key: true
      t.references :proyect, foreign_key: true

      t.timestamps
    end
  end
end
