unless ENV["NO_COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require 'spec_helper'
