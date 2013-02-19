class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.decimal :price
      t.string :title
      t.text :description
      t.integer :length

      t.timestamps
    end
  end
end
