require "spec_helper"

describe Command::Definition do

  describe "#run" do
    let(:cmd) { 'ruby -e "STDOUT.print \"hello\"; STDERR.print \"world\";"' }
    let(:command) { Command::Definition.new(cmd) }
    let(:stdout) { double(:stdout) }
    let(:stderr) { double(:stderr) }
    let(:status) { double(:status, exitstatus: 1, success?: false, pid: 123) }

    it "sets the standard output" do
      expect {
        command.run
      }.to change {
        command.stdout
      }.from(nil).to('hello')
    end

    it "sets the standard error" do
      expect {
        command.run
      }.to change {
        command.stderr
      }.from(nil).to('world')
    end

    it "sets the exit status" do
      expect {
        command.run
      }.to change {
        command.exitstatus
      }.from(nil).to(0)
    end

    it "sets the success" do
      expect {
        command.run
      }.to change {
        command.success?
      }.from(nil).to(true)
    end

    it "sets the PID" do
      expect {
        command.run
      }.to change {
        command.pid
      }.from(nil).to be_a(Fixnum)
    end

    it "returns the command" do
      expect(command.run).to eq(command)
    end
  end
end
