class AddProjectToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :project, foreign_key: true
  end
end
