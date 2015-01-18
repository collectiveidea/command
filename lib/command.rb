require "open3"

class Command
  attr_reader :cmd, :stdout, :stderr

  def self.run(cmd)
    new(cmd).run
  end

  def initialize(cmd)
    @cmd = cmd
  end

  def run
    @stdout, @stderr, @status = Open3.capture3(cmd)
    self
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
