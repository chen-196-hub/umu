# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'
require 'i18n'

# ModelMaker is a module for generating model.
module ModelMaker
  class << self
    include Template
    COLUMN_TYPE = %w[
      string
      text
      integer
      float
      decimal
      datetime
      timestamp
      time
      date
      binary
      boolean
      primary_key
    ].freeze
    def generator
      model_name = Umu::Inputter.input(I18n.t('model.make_name'))
      cover(1)
      show_command('model', model_name)
      is_make_column = Umu::Selector.single_choice(I18n.t('model.make_column'))
      cover(1)
      columns = []
      while is_make_column
        columns << make_column
        show_command('model', model_name, columns.join(' '))
        is_make_column = Umu::Selector.single_choice(I18n.t('model.make_column_continue'))
        cover(1)
      end

      show_command('model', model_name, columns.join(' '))
      cover(1)
      is_make_options = Umu::Selector.single_choice(I18n.t('common.make_options'))
      cover(1)
      options = ''
      options = Umu::Inputter.input(I18n.t('common.add_option'), true) if is_make_options
      cover(1) if is_make_options

      command = command('model', model_name, columns.join(' '), options)
      cover(1)
      puts command
      confirm_content = I18n.t('common.run_command')
      run_command = Umu::Selector.single_choice(confirm_content)
      cover(1)
      puts confirm_content + (run_command ?I18n.t('affirm') : I18n.t('deny'))
      system(command) if run_command
      true
    end

    def make_column
      colum_name = Umu::Inputter.input(I18n.t('model.make_column_name'))
      cover(1)
      type = Umu::Selector.radio(COLUMN_TYPE, I18n.t('model.choose_column_type'))
      cover(2)
      "#{colum_name}:#{type}"
    end
  end
end
