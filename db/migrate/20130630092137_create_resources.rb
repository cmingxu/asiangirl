class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :category_id
      t.string :slug
      t.string :storage

      t.timestamps
    end
  end
end
