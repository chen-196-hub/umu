# frozen_string_literal: true

require_relative '../../lib/umu/beautifica/assets/template'

RSpec.describe 'colors' do
  include Template
  context '#pointer' do
    it { expect(pointer(true)).to eq(' > ') }
    it { expect(pointer(false)).to eq('   ') }
  end
  context '#checker' do
    it { expect(checker(true, 'test')).to eq("(○) \e[34mtest\e[0m") }
    it { expect(checker(false, 'test')).to eq('( ) test') }
  end
  context '#hover' do
    it { expect(hover(true, 'test')).to eq("\e[32mtest\e[0m") }
    it { expect(hover(false, 'test')).to eq('test') }
  end
  context '#cover' do
    it { expect { cover(3) }.to output("\e[3A\e[0J\e[1A\n").to_stdout }
  end
end
