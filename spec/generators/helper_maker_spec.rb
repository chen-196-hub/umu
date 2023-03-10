# frozen_string_literal: true

require_relative '../../lib/umu/generators/helper_maker'

RSpec.describe HelperMaker do
  describe '.generator' do
    context 'when user make helper' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(true)
      end
      it 'generates helper' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
