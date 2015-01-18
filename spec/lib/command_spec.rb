require 'spec_helper'

describe Command do

  describe '.run' do
    let(:cmd) { double(:cmd) }
    let(:runner) { double(Command::Runner) }
    let(:definition) { double(Command::Definition) }
    let(:result) { double(Command::Result) }

    it 'initializes, runs and returns a new command' do
      expect(Command::Runner).to receive(:new).once.with(no_args) { runner }
      expect(Command::Definition).to receive(:new).once.with(cmd) { definition }
      expect(runner).to receive(:run).once.with(definition) { result }

      expect(Command.run(cmd)).to eq(result)
    end
  end

end
