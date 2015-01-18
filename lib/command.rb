require 'open3'

require 'command/definition'
require 'command/result'

module Command

  def self.run(cmd)
    definition = Command::Definition.new(cmd)
    definition.run
  end

end
