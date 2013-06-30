class Storage < CarrierWave::Uploader::Base
  storage :fog

  include CarrierWave::RMagick

  storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

end
