class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id, :resource_count, :slug
  has_many :resources
end
