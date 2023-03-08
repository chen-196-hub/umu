# frozen_string_literal: true

require_relative 'umu/core/selector'
require_relative 'umu/core/inputter'
require_relative 'umu/core/language_setting'
require_relative 'umu/generators'
require_relative 'umu/beautifica/beautifica'
require_relative 'umu/version'
require 'i18n'

##
# UmuはRailsのコードを自動生成するためのツールです。
module Umu
  class Error < StandardError; end
  include Umu::Generators
  extend Color
  def self.generator
    Umu::LanguageSetting.setup_language
    items = %w[model controller migration application_record helper channel job task mailer mailbox benchmark
               resource].freeze
    content = "#{green('?')} #{I18n.t(:umu)}"
    target = Umu::Selector.radio(items, content)
    puts "\e[2A"
    puts "#{content} #{green(target)}"
    Umu::Generators.run(target)
  end
end
