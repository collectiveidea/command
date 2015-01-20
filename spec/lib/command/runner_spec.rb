require "spec_helper"

describe Command::Runner do

  describe "#run" do

    context "when command exits successfully" do
      let(:cmd) { "ruby -e 'STDOUT.sync=STDERR.sync=true; STDOUT.print \"hello\"; sleep(0.01); STDERR.print \"world\";'" }
      let(:definition) { Command::Definition.new(cmd) }
      let(:runner) { Command::Runner.new }
      let(:result) { runner.run(definition) }

      it "returns a result" do
        expect(result).to be_a(Command::Result)
      end

      it "sets the standard output" do
        expect(result.stdout).to eq("hello")
      end

      it "sets the standard error" do
        expect(result.stderr).to eq("world")
      end

      it "sets the combined output" do
        expect(result.output).to eq("helloworld")
      end

      it "sets the exit status" do
        expect(result.exitstatus).to eq(0)
      end

      it "sets the success" do
        expect(result.success?).to eq(true)
      end

      it "sets the PID" do
        expect(result.pid).to be_a(Fixnum)
      end
    end

    context "when command fails" do
      let(:cmd) { "ruby -e 'STDOUT.sync=STDERR.sync=true; STDOUT.print \"hello\"; sleep(0.01); STDERR.print \"world\"; exit(1);'" }
      let(:definition) { Command::Definition.new(cmd) }
      let(:runner) { Command::Runner.new }
      let(:result) { runner.run(definition) }

      it "returns a result" do
        expect(result).to be_a(Command::Result)
      end

      it "sets the standard output" do
        expect(result.stdout).to eq("hello")
      end

      it "sets the standard error" do
        expect(result.stderr).to eq("world")
      end

      it "sets the combined output" do
        expect(result.output).to eq("helloworld")
      end

      it "sets the exit status" do
        expect(result.exitstatus).to eq(1)
      end

      it "sets the success" do
        expect(result.success?).to eq(false)
      end
    end

  end
end
