# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )

ClarifaiRuby.configure do |config|
  config.base_url       = "https://api.clarifai.com"
  config.version_path   = "/v1"
  config.client_id      = "WJ4rj0MW8Gg1_LYqIxwx0hLD5Y8PsgoYSQQcYAh0"
  config.client_secret  = "4EN4xz68ZAkasF24x6koqsv4ejg3-VcTsQ7kAgvG"
end