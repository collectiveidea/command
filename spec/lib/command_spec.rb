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
end
