CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-]/

CarrierWave.configure do |config|

  if Rails.env.production?
    config.storage = :fog

    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    }

    config.fog_directory                    = 'working-on'
    config.fog_public                       = false
    config.fog_authenticated_url_expiration = 3600
    config.fog_attributes                   = { 'Cache-Control' => 'public, max-age=315576000' }
  else
    config.storage = :file
  end

  config.cache_dir = 'tmp'

end

module CarrierWave
  module Uploader
    class Base

      def store_dir
        "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end

    end
  end
end
