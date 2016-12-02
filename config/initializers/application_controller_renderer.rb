# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )

ClarifaiRuby.configure do |config|
  config.base_url       = "https://api.clarifai.com"
  config.version_path   = "/v1"
  config.client_id      = "otcgFwccUFB8zqc8WFLvCsECA4PoECNvoWYXmYuY"
  config.client_secret  = "ILFtTwmzLa8GxUeGCMN1vENLbaGSgOAC3zY--q5s"
end
