CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                # required
    :aws_access_key_id      => ENV['AWS_ACCESS'],        # required ENV['AWS_ACCESS']
    :aws_secret_access_key  => ENV['AWS_SECRET'],    #ENV['AWS_SECRET'],    # required
    :region                 => 'us-west-1'           # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'picture.me-christina'

 	if Rails.env.test?
  	config.storage = :file
  else
    config.storage = :fog
  end

end