module Command
  class Runner

    # @param [Command::Definition] definition
    # @return [Command::Result]
    def run(definition)
      output = {:stdout => '', :stderr => '', :combined => ''}
      status = nil

      Open3.popen3(definition.cmd) do |stdin, stdout, stderr, wait_thr|
        stdin.close

        streams_read_open = [stdout, stderr]
        begin
          streams_read_available, _, _ = IO.select(streams_read_open)

          streams_read_available.each do |stream|
            if stream.eof?
              stream.close
              streams_read_open.delete(stream)
            else
              data = stream.readpartial(4096)
              output[:stdout] += data if stdout === stream
              output[:stderr] += data if stderr === stream
              output[:combined] += data
            end
          end
        end until streams_read_open.empty?

        status = wait_thr.value
      end

      Command::Result.new(output, status)
    end

  end
end
