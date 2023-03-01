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
  module Generators
    def self.model
      ModelMaker.generator
    end

    def self.controller
      ControllerMaker.generator
    end

    def self.migration
      MigrationMaker.generator
    end

    def self.application_record
      ApplicationRecordMaker.generator
    end

    def self.helper
      HelperMaker.generator
    end

    def self.channel
      ChannelMaker.generator
    end

    def self.job
      JobMaker.generator
    end

    def self.task
      TaskMaker.generator
    end

    def self.mailer
      MailerMaker.generator
    end

    def self.mailbox
      MailboxMaker.generator
    end

    def self.benchmark
      BenchmarkMaker.generator
    end
    
    def self.resource
      ResourceMaker.generator
    end
  end
end
