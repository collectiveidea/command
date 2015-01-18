module Command
  class Definition

    attr_reader :cmd

    def initialize(cmd)
      @cmd = cmd
    end

    def run
      stdout, stderr, status = Open3.capture3(cmd)
      output = {:stdout => stdout, :stderr => stderr}
      Command::Result.new(@cmd, output, status)
    end

  end
end
