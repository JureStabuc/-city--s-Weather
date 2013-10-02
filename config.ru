require './index'

ForecastIO.configure do |configuration|
  configuration.api_key = 'cd3c3e767f7c3b35ce602781e96f3289'
end

run Sinatra::Application
