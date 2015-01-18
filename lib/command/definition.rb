module Command
  class Definition

    attr_reader :cmd

    # @param [String] cmd
    def initialize(cmd)
      @cmd = cmd
    end

  end
end
