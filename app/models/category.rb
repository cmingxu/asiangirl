class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id, :resource_count, :slug
  has_many :resources
  has_many :galleries


  class << self
    def top
      Category.first
    end

    def stuff_picks
      Category.all[1]
    end

    def recommend
      Category.all[2]
    end
  end
end
