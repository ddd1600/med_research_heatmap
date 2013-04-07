# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BootstrapRspecLibioCloneApp::Application.initialize!

BootstrapRspecLibioCloneApp::Application.configure do
  config.gem 'to-csv', :lib => 'to_csv', :source => 'http://rubygems.org'
end
