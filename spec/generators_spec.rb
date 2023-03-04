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

  context '.migration' do
    before do
      allow(MigrationMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.migration).to eq(true) }
  end

  context '.application_record' do
    before do
      allow(ApplicationRecordMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.application_record).to eq(true) }
  end

  context '.helper' do
    before do
      allow(HelperMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.helper).to eq(true) }
  end

  context '.channel' do
    before do
      allow(ChannelMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.channel).to eq(true) }
  end

  context '.job' do
    before do
      allow(JobMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.job).to eq(true) }
  end

  context '.task' do
    before do
      allow(TaskMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.task).to eq(true) }
  end

  context '.mailer' do
    before do
      allow(MailerMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.mailer).to eq(true) }
  end

  context '.mailbox' do
    before do
      allow(MailboxMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.mailbox).to eq(true) }
  end

  context '.benchmark' do
    before do
      allow(BenchmarkMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.benchmark).to eq(true) }
  end

  context '.resource' do
    before do
      allow(ResourceMaker).to receive(:generator).and_return(true)
    end
    it { expect(Umu::Generators.resource).to eq(true) }
  end
end
