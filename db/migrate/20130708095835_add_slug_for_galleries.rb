class AddSlugForGalleries < ActiveRecord::Migration
  def up
    add_column :galleries, :slug, :string
  end

  def down
    remove_column :galleries, :slug
  end
end
