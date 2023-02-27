# frozen_string_literal: true

require_relative '../../lib/umu/generators/mailer'

RSpec.describe Mailer do
  describe '.generator' do
    before do
      allow(Umu::Inputter).to receive(:input).and_return('test')
      allow(Umu::Selector).to receive(:single_choice).and_return(false)

      it 'generates mailer' do
        expect(described_class.generator).to eq(true)
      end
    end
  end
end
