# Hace require de los gems necesarios.
# Revisa: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "4HkhPhoLvR5cHVda468za75fg"
  config.consumer_secret     = "IYzTJ5j9iDbXTtQm13NSRpIiQNvFJ5iwoxKhu5bbqFlnntjju8"
  config.access_token        = "752909608146964480-Q0bZgMP8yBwc5Tjy6pbIMrRdnnolGUP"
  config.access_token_secret = "ECMp6945B7oONednr7Kmkzg5SoU3MMlWy880dBWh2GZqX"
end




