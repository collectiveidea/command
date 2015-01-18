require 'spec_helper'

describe Command::Definition do

  describe '#initialize' do
    let(:cmd) { 'my command' }
    let(:definition) { Command::Definition.new(cmd) }

    it 'sets the cmd' do
      expect(definition.cmd).to eq(cmd)
    end
  end

end
