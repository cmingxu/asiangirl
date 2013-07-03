class Gallery < ActiveRecord::Base
  attr_accessible :category_id, :name, :slug
  has_many :resources
  belongs_to :category
  has_one :cover, :class_name => "Resource", :conditions => "name='cover.jpg'"

  def cover_url
    self.cover.try(:storage).try(:url) 
  end
end
