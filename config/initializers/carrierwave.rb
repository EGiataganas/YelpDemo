CarrierWave.configure do |config|
  if ENV['S3_KEY'] && ENV['S3_SECRET'] && ENV['S3_BUCKET_NAME']
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_KEY'],
      aws_secret_access_key: ENV['S3_SECRET'],
      region: ENV['S3_REGION']
    }
    config.fog_directory  = ENV['S3_BUCKET_NAME']
  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :file
  end
end