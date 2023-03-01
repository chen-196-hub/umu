# frozen_string_literal: true

require_relative '../../lib/umu/generators/task_maker'

RSpec.describe TaskMaker do
  describe '.generator' do
    context 'when user make task' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(false)
      end

      it 'generates task' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
