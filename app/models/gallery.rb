class Gallery < ActiveRecord::Base
  attr_accessible :category_id, :name, :slug
  has_many :resources
  belongs_to :category
  has_one :cover, :class_name => "Resource", :conditions => "name='cover.jpg'"

  
  def cover_url
    self.cover.try(:storage).try(:url) 
  end

  def alt
    self.en_name || self.name 
  end

  def to_query
    self.slug || self.id 
  end

  def to_param
    self.slug || self.id 
  end

end
