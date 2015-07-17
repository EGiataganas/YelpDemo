CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['aws_access_key_id'],                        # required
    aws_secret_access_key: ENV['aws_secret_access_key'],                        # required,
    endpoint:              ENV['aws_endpoint'],
    region:               ENV['aws_region'] 
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end
 
  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
 
  config.fog_directory    = ENV['fog_directory']
  config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  config.fog_host         = "#{ENV['aws_endpoint']}/#{ENV['fog_directory']}"

  config.fog_directory  = ENV['fog_directory']                          # required
end