module Command
  class Runner

    # @param [Command::Definition] definition
    # @return [Command::Result]
    def run(definition)
      stdout, stderr, status = Open3.capture3(definition.cmd)
      output = {:stdout => stdout, :stderr => stderr}
      Command::Result.new(definition.cmd, output, status)
    end

  end
end
