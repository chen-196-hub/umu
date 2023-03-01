# frozen_string_literal: true

require_relative '../../lib/umu/generators/job_maker'

RSpec.describe JobMaker do
  describe '.generator' do
    context 'when user make job' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(false)
      end
      it 'generates job' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
