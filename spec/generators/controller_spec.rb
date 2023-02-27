# frozen_string_literal: true

require_relative '../../umu/generators/controller'

# 修正必要ある
RSpec.describe Controller do
  describe '.generator' do
    context 'when user do not make action' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(false)
      end
      it 'generates controller' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
