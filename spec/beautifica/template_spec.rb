# frozen_string_literal: true

require_relative '../../lib/umu/beautifica/assets/template'

RSpec.describe 'colors' do
  include Template
  context '#pointer' do
    it { expect(pointer(true)).to eq(' > ') }
    it { expect(pointer(false)).to eq('   ') }
  end
  context '#checker' do
    it { expect(checker(true, 'test')).to eq("(○) \e[36mtest\e[0m") }
    it { expect(checker(false, 'test')).to eq('( ) test') }
  end
  context '#hover' do
    it { expect(hover(true, 'test')).to eq("\e[32mtest\e[0m") }
    it { expect(hover(false, 'test')).to eq('test') }
  end
  context '#cover' do
    it { expect { cover(3) }.to output("\e[3A\e[0J\e[1A\n").to_stdout }
  end

  context '#show_command' do
    it { expect { show_command('test') }.to output("\e[32m>\e[0m rails generate test\n").to_stdout }
    it { expect { show_command('test', 'test') }.to output("\e[32m>\e[0m rails generate test test\n").to_stdout }
    it {
      expect do
        show_command('test', 'test', 'test')
      end.to output("\e[32m>\e[0m rails generate test test test\n").to_stdout
    }
    it {
      expect do
        show_command('test', 'test', 'test',
                     'test')
      end.to output("\e[32m>\e[0m rails generate test test test test\n").to_stdout
    }
  end

  context '#command' do
    it { expect(command('test')).to eq('rails generate test') }
    it { expect(command('test', 'test_name')).to eq('rails generate test test_name') }
    it { expect(command('test', 'test_name', 'sub_test_name')).to eq('rails generate test test_name sub_test_name') }
    it {
      expect(command('test', 'test_name', 'sub_test_name',
                     '-test')).to eq('rails generate test test_name sub_test_name -test')
    }
  end

  context '#logo' do
    it do
      expect { logo }.to output(<<-'UMU').to_stdout
     _   _
    | | | |_ __ ___  _   _ 
    | | | | '_ ` _ \| | | |
    | |_| | | | | | | |_| |
     \___/|_| |_| |_|\__,_|

    UMU
    end
  end
end
