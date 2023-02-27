# frozen_string_literal: true

require_relative '../umu/generators'
require_relative '../umu/generators/model'
require_relative '../umu/generators/controller'

RSpec.describe Umu::Generators do
  context '.model' do
    before do
      allow(Model).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.model).to eq(true) }
  end
  context '.controller' do
    before do
      allow(Controller).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.controller).to eq(true) }
  end
end
