class AddCreatorsDescriptionToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :creators_description, :text
  end
end
