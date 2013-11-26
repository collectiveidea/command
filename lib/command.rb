require "open3"

class Command
  attr_reader :stdin, :stdout, :stderr

  def self.run(stdin)
    new(stdin).run
  end

  def initialize(stdin)
    @stdin = stdin
  end

  def run
    @stdout, @stderr, @status = Open3.capture3(stdin)
  end

  def exitstatus
    @status && @status.exitstatus
  end

  alias_method :status, :exitstatus

  def success?
    @status && @status.success?
  end

  def pid
    @status && @status.pid
  end
end
