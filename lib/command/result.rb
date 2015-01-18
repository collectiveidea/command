module Command
  class Result

    attr_reader :cmd

    # @param [String] cmd
    # @param [Hash] output
    # @option output_streams [String] :stdout
    # @option output_streams [String] :stderr
    # @param [Process::Status] status
    def initialize(cmd, output, status)
      @cmd = cmd
      @output = output
      @status = status
    end

    def stdout
      @output[:stdout]
    end

    def stderr
      @output[:stderr]
    end

    def exitstatus
      @status.exitstatus
    end

    alias_method :status, :exitstatus

    def success?
      @status.success?
    end

    def pid
      @status.pid
    end

  end
end
