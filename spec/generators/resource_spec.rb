require_relative '../../umu/generators/resource'

RSpec.describe Resource do
  describe '.generator' do
    context 'when user do not make column' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(false)
      end
      it 'generates resource' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end