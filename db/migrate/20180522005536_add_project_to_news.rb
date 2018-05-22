class AddProjectToNews < ActiveRecord::Migration[5.2]
  def change
    add_reference :news, :project, foreign_key: true
  end
end
