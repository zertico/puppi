require 'fakefs/spec_helpers'
require 'mail'
require 'coveralls'

Coveralls.wear!

require "#{File.dirname(__FILE__)}/../lib/puppi"

Mail.defaults do
  delivery_method :test
end

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers
end