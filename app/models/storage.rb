class Storage < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog
  include CarrierWave::MimeTypes
  process :set_content_type

  def process_uri(uri) 
    URI.parse(URI.escape(URI.unescape(uri)))
  end 

  def store_dir
    "images/#{model.gallery.name}"
  end
end
