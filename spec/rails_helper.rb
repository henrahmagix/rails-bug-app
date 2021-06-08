require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

require 'rspec/rails'

RSpec.configure do |config|
  config.filter_rails_from_backtrace!
end
