# frozen_string_literal: true

require_relative '../../lib/umu/core/selector'
require 'io/console'

RSpec.describe Umu::Selector do
  describe '.single_choice' do
    context 'when user choose Yes' do
      before do
        allow(described_class).to receive(:radio).and_return('Yes')
      end
      it 'return true' do
        expect(described_class.single_choice('test')).to eq(true)
      end
    end

    context 'when user choose No' do
      before do
        allow(described_class).to receive(:radio).and_return('No')
      end
      it 'return false' do
        expect(described_class.single_choice('test')).to eq(false)
      end
    end
  end

  describe '.radio' do
    include Template
    let(:options) { %w[option1 option2 option3] }
    let(:content) { 'test' }

    context 'when selecting the first option' do
      before do
        allow(described_class).to receive(:radio_interactive_menu).and_return('option1')
      end
      it 'allows user to select options with arrow keys' do
        expect(described_class.radio(options, content)).to eq('option1')
      end
    end

    context 'when selecting the second option' do
      before do
        allow(described_class).to receive(:radio_interactive_menu).and_return('option2')
      end

      it 'returns the second option' do
        expect(described_class.radio(options, content)).to eq('option2')
      end
    end

    context 'when selecting the last option' do
      before do
        allow(described_class).to receive(:radio_interactive_menu).and_return('option3')
      end

      it 'returns the last option' do
        expect(described_class.radio(options, content)).to eq('option3')
      end
    end

    context 'when exiting the menu' do
      before do
        allow(described_class).to receive(:radio_interactive_menu).and_return(nil)
      end

      it 'returns nil' do
        expect(described_class.radio(options, content)).to be_nil
      end
    end
  end

  describe '.checkbox' do
    include Template
    let(:options) { %w[option1 option2 option3] }
    let(:content) { 'test' }

    context 'when selecting the option1 and option2' do
      before do
        allow(described_class).to receive(:checkbox_interactive_menu).and_return(%w[option1 option2])
      end
      it 'allows user to select options with arrow keys' do
        expect(described_class.checkbox(options, content)).to eq(%w[option1 option2])
      end
    end
  end

  describe '.radio_interactive_menu' do
    include Template
    let(:options) { %w[option1 option2 option3] }

    context 'when selecting the first option' do
      before do
        allow($stdin).to receive(:getch).and_return("\r")
      end
      it 'allows user to select options with arrow keys' do
        expect(described_class.radio_interactive_menu(options)).to eq('option1')
      end
    end

    context 'when selecting the second option' do
      before do
        allow($stdin).to receive(:getch).and_return("\e", '[', 'B', "\r")
      end
      it 'returns the second option' do
        expect(described_class.radio_interactive_menu(options)).to eq('option2')
      end
    end

    context 'when selecting the last option' do
      before do
        allow($stdin).to receive(:getch).and_return("\e", '[', 'B', "\e", '[', 'B', "\r")
      end

      it 'returns the last option' do
        expect(described_class.radio_interactive_menu(options)).to eq('option3')
      end
    end

    context 'when exiting the menu' do
      before do
        allow($stdin).to receive(:getch).and_return("\C-c")
      end

      it 'returns nil' do
        expect(described_class.radio_interactive_menu(options)).to be_nil
      end
    end
  end

  describe '.check_interactive_menu' do
    context 'when options are provided' do
      let(:options) { %w[OptionA OptionB OptionC OptionD OptionE] }

      it 'selects the correct options' do
        allow($stdin).to receive(:getch).and_return("\r")
        expect(described_class.checkbox_interactive_menu(options)).to eq([])
      end

      it 'just pass enter' do
        allow($stdin).to receive(:getch).and_return("\e", '[', 'B', "\r")
        expect(described_class.checkbox_interactive_menu(options)).to eq([])
      end

      it 'selects the correct options' do
        allow($stdin).to receive(:getch).and_return("\e", '[', 'B', ' ', "\r")
        expect(described_class.checkbox_interactive_menu(options)).to eq(['OptionB'])
      end

      it 'selects multiple options' do
        allow($stdin).to receive(:getch).and_return("\e", '[', 'B', ' ', "\e", '[', 'C', ' ', "\r")
        expect(described_class.checkbox_interactive_menu(options)).to eq(%w[OptionB OptionC])
      end

      it 'cancel selection' do
        allow($stdin).to receive(:getch).and_return("\e", '[', 'B', ' ', "\e", '[', 'C', ' ', ' ', "\r")
        expect(described_class.checkbox_interactive_menu(options)).to eq(['OptionB'])
      end

      # 別途、C-cを押したときのテストを書く
      # it 'when press C-c' do
      #   allow($stdin).to receive(:getch).and_return("\C-c")
      #   expect { described_class.checkbox_interactive_menu(options) }.to raise_error(SystemExit)
      # end
    end

    context 'when no options are provided' do
      let(:options) { [] }

      it 'returns an empty array' do
        expect(described_class.checkbox_interactive_menu(options)).to be_empty
      end
    end
  end
end
