access_key_id = "AKIAJ6FLDCQHN4EKVGFQ"
secret_access_key = "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"

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => access_key_id,                        # required
    :aws_secret_access_key  => secret_access_key,                        # required
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'sshpics'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
