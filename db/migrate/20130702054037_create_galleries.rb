class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :category_id
      t.string :slug

      t.timestamps
    end
  end
end
