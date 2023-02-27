# frozen_string_literal: true

require_relative  'umu/core/selector'
require_relative  'umu/core/inputter'
require_relative  'umu/generators'
require_relative 'umu/beautifica/beautifica'
require_relative "umu/version"

module Umu
  class Error < StandardError; end
  include Umu::Generators
  extend Color
  def self.generator
    items = %w[model controller migration application_record helper channel job task mailer mailbox benchmark resource].freeze
    content = "#{green('?')} 何生成しますか?"
    target = Umu::Selector.radio(items, content)
    puts "\e[2A"
    puts "#{content} #{green(target)}"
    Umu::Generators.send(target)
  end
end
