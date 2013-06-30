class Resource < ActiveRecord::Base
  mount_uploader :storage, Storage
  
  attr_accessible :category_id, :file, :name, :slug, :storage
  belongs_to :category
end
