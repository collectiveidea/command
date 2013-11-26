require "coveralls"
Coveralls.wear!

require "command"

require "bundler"
Bundler.require(:test)

Dir[File.expand_path("../support/*.rb", __FILE__)].each { |f| require f }
