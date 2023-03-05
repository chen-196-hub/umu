# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'
require 'i18n'

# ControllerMaker is a module for generating controller.
module ControllerMaker
  class << self
    include Template
    ACTIONS = %w[
      index
      show
      edit
      create
      update
      destroy
      other
    ].freeze
    def generator
      controller_name = Umu::Inputter.input(I18n.t('controller.make_name'))
      cover(1)
      show_command('controller', controller_name)
      make_actions = Umu::Selector.single_choice(I18n.t('controller.make_actions'))
      cover(1)
      actions = []
      if make_actions
        actions = Umu::Selector.checkbox(ACTIONS, I18n.t('controller.select_actions'))
        cover(1)
        cover(1)
        show_command('controller', controller_name, actions.join(' '))
        if actions.include?('other')
          make_action = true
          actions.delete('other')
          while make_action
            original_action_name = Umu::Inputter.input(I18n.t('controller.make_action_name'), true, actions)
            actions << original_action_name
            cover(2)
            show_command('controller', controller_name, actions.join(' '))
            make_action = Umu::Selector.single_choice(I18n.t('controller.make_action_continue'))
            cover(1)
          end
        end
      end
      is_make_options = Umu::Selector.single_choice(I18n.t('common.make_options'))
      options = ''
      cover(1)
      options = Umu::Inputter.input(I18n.t('common.add_option'), true) if is_make_options
      cover(1) if is_make_options
      command = command('controller', controller_name, actions.join(' '), options)
      cover(1)
      puts command
      confirm_content = I18n.t('common.run_command')
      run_command = Umu::Selector.single_choice(confirm_content)
      cover(1)
      puts confirm_content + (run_command ? I18n.t('affirm') : I18n.t('deny'))
      system(command) if run_command
      true
    end
  end
end
