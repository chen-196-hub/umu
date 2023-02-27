# frozen_string_literal: true

require_relative '../../lib/umu/generators/channel'

RSpec.describe Channel do
  describe '.generator' do
    context 'when user make channel' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(false)
      end
      it 'generates channel' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
