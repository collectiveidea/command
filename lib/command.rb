require 'open3'

require 'command/definition'
require 'command/runner'
require 'command/result'

module Command

  def self.run(cmd)
    definition = Command::Definition.new(cmd)
    runner = Command::Runner.new
    runner.run(definition)
  end

end
