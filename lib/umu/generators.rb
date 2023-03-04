# frozen_string_literal: true

require_relative 'generators/model_maker'
require_relative 'generators/controller_maker'
require_relative 'generators/migration_maker'
require_relative 'generators/application_record_maker'
require_relative 'generators/helper_maker'
require_relative 'generators/channel_maker'
require_relative 'generators/job_maker'
require_relative 'generators/task_maker'
require_relative 'generators/mailer_maker'
require_relative 'generators/mailbox_maker'
require_relative 'generators/benchmark_maker'
require_relative 'generators/resource_maker'

module Umu
  ##
  # Umu is a tool for automatically generating Rails code.
  module Generators
    GENERATORS = {
      model: ModelMaker,
      controller: ControllerMaker,
      migration: MigrationMaker,
      application_record: ApplicationRecordMaker,
      helper: HelperMaker,
      channel: ChannelMaker,
      job: JobMaker,
      task: TaskMaker,
      mailer: MailerMaker,
      mailbox: MailboxMaker,
      benchmark: BenchmarkMaker,
      resource: ResourceMaker
    }.freeze

    def self.run(target)
      generator = GENERATORS[target.to_sym].generator
      raise "Invalid target #{target}" unless generator

      generator
    end
  end
end
