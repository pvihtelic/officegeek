class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.integer :package_id
      t.decimal :price
      t.string :title
      t.text :description
      t.integer :length

      t.timestamps
    end
  end
end
