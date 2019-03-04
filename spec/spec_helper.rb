require 'bundler/setup'
require 'universities'

require 'vcr'
require_relative 'support/vcr_setup'
require 'webmock/rspec'

require_relative 'support/shared_examples/array_of_entities'

WebMock.disable_net_connect!(allow: 'universities.hipolabs.com')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
