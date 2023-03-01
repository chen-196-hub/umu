require_relative '../../lib/umu/generators/benchmark_maker'

RSpec.describe BenchmarkMaker do
  describe '.generator' do
    before do
      allow(Umu::Inputter).to receive(:input).and_return('test')
      allow(Umu::Selector).to receive(:single_choice).and_return(false)
    end
    it 'generates benchmark' do
      expect(described_class.generator).to eq(true)
    end
  end
end