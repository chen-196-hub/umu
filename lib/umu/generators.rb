# frozen_string_literal: true

require_relative 'generators/model'
require_relative 'generators/controller'
require_relative 'generators/migration'
require_relative 'generators/application_record'
require_relative 'generators/helper'
require_relative 'generators/channel'
require_relative 'generators/job'
require_relative 'generators/task'
require_relative 'generators/mailer'
require_relative 'generators/mailbox'
require_relative 'generators/benchmark'
require_relative 'generators/resource'

module Umu
  module Generators
    def self.model
      Model.generator
    end

    def self.controller
      Controller.generator
    end

    def self.migration
      Migration.generator
    end

    def self.application_record
      ApplicationRecord.generator
    end

    def self.helper
      Helper.generator
    end

    def self.channel
      Channel.generator
    end

    def self.job
      Job.generator
    end

    def self.task
      Task.generator
    end

    def self.mailer
      Mailer.generator
    end

    def self.mailbox
      Mailbox.generator
    end

    def self.benchmark
      Benchmark.generator
    end
    
    def self.resource
      Resource.generator
    end
  end
end
