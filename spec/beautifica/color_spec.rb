# frozen_string_literal: true

require_relative '../../lib/umu/beautifica/assets/color'

RSpec.describe 'colors' do
  include Color
  context '#black' do
    it { expect(black('test')).to eq("\e[30mtest\e[0m") }
  end

  context '#red' do
    it { expect(red('test')).to eq("\e[31mtest\e[0m") }
  end

  context '#green' do
    it { expect(green('test')).to eq("\e[32mtest\e[0m") }
  end

  context '#yellow' do
    it { expect(yellow('test')).to eq("\e[33mtest\e[0m") }
  end

  context '#blue' do
    it { expect(blue('test')).to eq("\e[34mtest\e[0m") }
  end

  context '#magenta' do
    it { expect(magenta('test')).to eq("\e[35mtest\e[0m") }
  end

  context '#syan' do
    it { expect(syan('test')).to eq("\e[36mtest\e[0m") }
  end

  context '#white' do
    it { expect(white('test')).to eq("\e[37mtest\e[0m") }
  end
end
