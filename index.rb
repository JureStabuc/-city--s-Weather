require 'rubygems'
require 'sinatra'
require 'forecast_io'
require 'geocoder'


Geocoder.configure(:timeout => 60)

ForecastIO.configure do |configuration|
	configuration.api_key = 'cd3c3e767f7c3b35ce602781e96f3289'
end

ForecastIO.configure do |configuration|
  configuration.default_params = {units: 'si'}
end

get'/' do

	result = request.location
	@lat = result.latitude
	@long = result.longitude

	city = request.location.city
	@city = city

	forecast = ForecastIO.forecast(@lat, @long)
	@forecast = forecast.currently.summary
	@temperature = forecast.currently.temperature
	@temperature.round
	@icon = forecast.currently.icon

erb :home

end