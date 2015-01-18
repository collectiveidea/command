require 'spec_helper'

describe Command do
  describe '.run' do
    let(:cmd) { double(:cmd) }
    let(:definition) { double(:definition) }

    it 'initializes, runs and returns a new command' do
      expect(Command::Definition).to receive(:new).once.with(cmd) { definition }
      expect(definition).to receive(:run).once.with(no_args) { definition }

      expect(Command.run(cmd)).to eq(definition)
    end
  end
end
