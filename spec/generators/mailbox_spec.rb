require_relative '../../umu/generators/mailbox'

RSpec.describe Mailbox do
  describe '.generator' do
    context 'when user make mailbox' do
      before do
        allow(Umu::Inputter).to receive(:input).and_return('test')
        allow(Umu::Selector).to receive(:single_choice).and_return(false)
      end

      it 'generates mailbox' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
