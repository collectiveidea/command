require "open3"

class Command
  attr_reader :stdin

  def self.run(stdin)
    new(stdin).run
  end

  def initialize(stdin)
    @stdin = stdin
  end

  def run
    Open3.capture3(stdin)
  end
end
