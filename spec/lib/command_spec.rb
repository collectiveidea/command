require 'spec_helper'

describe Command do

  describe '.run' do
    let(:cmd) { double(:cmd) }
    let(:definition) { double(:definition) }
    let(:result) { double(:result) }

    it 'initializes, runs and returns a new command' do
      expect(Command::Definition).to receive(:new).once.with(cmd) { definition }
      expect(definition).to receive(:run).once.with(no_args) { result }

      expect(Command.run(cmd)).to eq(result)
    end
  end

end
