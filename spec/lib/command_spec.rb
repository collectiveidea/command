require "spec_helper"

describe Command do
  describe ".run" do
    let!(:cmd) { double(:cmd) }
    let(:command) { double(:command) }

    it "initializes, runs and returns a new command" do
      expect(Command).to receive(:new).once.with(cmd) { command }
      expect(command).to receive(:run).once.with(no_args) { command }

      expect(Command.run(cmd)).to eq(command)
    end
  end

  describe "#initialize" do
    let!(:cmd) { "man touch" }

    it "sets the standard cmd" do
      command = Command.new(cmd)

      expect(command.cmd).to eq(cmd)
    end
  end

  describe "#run" do
    let!(:cmd) { "man touch" }
    let!(:command) { Command.new(cmd) }
    let(:stdout) { double(:stdout) }
    let(:stderr) { double(:stderr) }
    let(:status) { double(:status, exitstatus: 1, success?: false, pid: 123) }
    let(:result) { [stdout, stderr, status] }

    before do
      Open3.stub(:capture3) { result }
    end

    it "runs the given input" do
      expect(Open3).to receive(:capture3).once.with(cmd) { result }

      command.run
    end

    it "sets the standard output" do
      expect {
        command.run
      }.to change {
        command.stdout
      }.from(nil).to(stdout)
    end

    it "sets the standard error" do
      expect {
        command.run
      }.to change {
        command.stdout
      }.from(nil).to(stdout)
    end

    it "sets the exit status" do
      expect {
        command.run
      }.to change {
        command.exitstatus
      }.from(nil).to(status.exitstatus)
    end

    it "sets the success" do
      expect {
        command.run
      }.to change {
        command.success?
      }.from(nil).to(status.success?)
    end

    it "sets the PID" do
      expect {
        command.run
      }.to change {
        command.pid
      }.from(nil).to(status.pid)
    end

    it "returns the command" do
      expect(command.run).to eq(command)
    end
  end
end
