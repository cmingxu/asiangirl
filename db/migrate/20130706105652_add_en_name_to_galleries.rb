class AddEnNameToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :en_name, :string
  end
end
