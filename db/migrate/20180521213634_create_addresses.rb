class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :apartment
      t.string :country
      t.integer :zip
      t.string :street
      t.integer :number
      t.string :city
      t.string :district
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
