# frozen_string_literal: true

require_relative '../lib/umu/generators'
require_relative '../lib/umu/generators/model_maker'
require_relative '../lib/umu/generators/controller_maker'

RSpec.describe Umu::Generators do
  context '.model' do
    before do
      allow(ModelMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.model).to eq(true) }
  end
  context '.controller' do
    before do
      allow(ControllerMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.controller).to eq(true) }
  end
end
