require "spec_helper"

describe Command do
  describe ".run" do
    let!(:stdin) { double(:stdin) }
    let(:command) { double(:command) }

    it "initializes, runs and returns a new command" do
      expect(Command).to receive(:new).once.with(stdin) { command }
      expect(command).to receive(:run).once.with(no_args) { command }

      expect(Command.run(stdin)).to eq(command)
    end
  end

  describe "#initialize" do
    let!(:stdin) { "man touch" }

    it "sets the standard input" do
      command = Command.new(stdin)

      expect(command.stdin).to eq(stdin)
    end
  end

  describe "#run" do
    let!(:stdin) { "man touch" }
    let!(:command) { Command.new(stdin) }
    let(:stdout) { double(:stdout) }
    let(:stderr) { double(:stderr) }
    let(:status) { double(:status) }

    it "runs the given input" do
      expect(Open3).to receive(:capture3).once.with(stdin)

      command.run
    end
  end
end
