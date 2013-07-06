module ApplicationHelper

  def s3_image_path image
    image_path(image) 
  end

  def icon_link(what)
   raw "<i class = 'icon-#{what.to_s}'></i>"
  end
end
