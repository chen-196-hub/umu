# frozen_string_literal: true

require_relative '../lib/umu/generators'
require_relative '../lib/umu/generators/model_maker'
require_relative '../lib/umu/generators/controller_maker'
require_relative '../lib/umu/generators/migration_maker'
require_relative '../lib/umu/generators/application_record_maker'
require_relative '../lib/umu/generators/helper_maker'
require_relative '../lib/umu/generators/channel_maker'
require_relative '../lib/umu/generators/job_maker'
require_relative '../lib/umu/generators/task_maker'
require_relative '../lib/umu/generators/mailer_maker'
require_relative '../lib/umu/generators/mailbox_maker'
require_relative '../lib/umu/generators/benchmark_maker'

RSpec.describe Umu::Generators do
  items = %w[model controller migration application_record helper channel job task mailer mailbox benchmark
             resource].freeze
  items.each do |target|
    context ".#{target}" do
      before do
        class_name = "#{target.split('_').map(&:capitalize).join}Maker"
        klass = Object.const_get(class_name)
        allow(klass).to receive(:generator).and_return(true)
      end
      it { expect(Umu::Generators.run(target)).to eq(true) }
    end
  end
end
