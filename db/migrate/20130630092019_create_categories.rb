class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.string :slug
      t.integer :resource_count

      t.timestamps
    end
  end
end
