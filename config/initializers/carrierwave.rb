CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    region: 'us-east-1',  # Замените на регион вашего ведра
    use_iam_profile: true
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.fog_public     = false  # Опционально - для приватного ведра
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } 
end
