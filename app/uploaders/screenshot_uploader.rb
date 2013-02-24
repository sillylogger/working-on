class ScreenshotUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  version :thumb do
    process resize_to_fill: [64, 64]
  end

end
