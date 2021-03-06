$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'rspec'
require 'pp'
require 'active_support'
require 'active_support/core_ext'

require "bill_hicks"

# support files
root = File.expand_path('../..', __FILE__)
Dir[File.join(root, "spec/support/*.rb")].each { |f| require f }

RSpec.configure do |config|

  # configure options for dummy FTP connection
  config.before(:suite) do
    BillHicks.configure do |config|
      config.ftp_host       = "ftp.host.com"
      config.top_level_dir  = "Test"
      config.submission_dir = "toBHC"
      config.response_dir   = "fromBHC"
    end
  end

  config.include FixtureHelper
end
