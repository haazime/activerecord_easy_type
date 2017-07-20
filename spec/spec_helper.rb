require 'bundler/setup'
require 'activerecord_easy_type'

require_relative './support/setup_db'
require_relative './support/models'
require_relative './support/value_objects'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:each) do
    Customer.destroy_all
  end
end
