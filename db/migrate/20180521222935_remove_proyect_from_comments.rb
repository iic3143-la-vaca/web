class RemoveProyectFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :proyect_id
  end
end
