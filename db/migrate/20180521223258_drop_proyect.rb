class DropProyect < ActiveRecord::Migration[5.1]
  def change
    drop_table :proyect_tags
    drop_table :proyects
  end
end
