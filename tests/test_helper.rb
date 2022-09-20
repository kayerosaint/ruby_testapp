ENV['APP_ENV'] = 'test'
Bundler.require
require './server'
require 'minitest/autorun'
require 'rack/test'

module Minitest
  # Test helper class - provide some usefull things for all tests
  class Test
    include Rack::Test::Methods

    def app
      Sinatra::Application
    end
  end
end
