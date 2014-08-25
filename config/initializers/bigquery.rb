GoogleBigquery::Config.setup do |config|
  config.pass_phrase = "notasecret"
  config.key_file    = Rails.root.to_s + "/config/keys/github.p12"
  config.client_id   = "XXXXXXXX.apps.googleusercontent.com"
  config.scope       = "https://www.googleapis.com/auth/bigquery"
  config.email       = "XXXXXXXX@developer.gserviceaccount.com"
end