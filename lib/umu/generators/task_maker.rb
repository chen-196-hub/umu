# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'
require 'i18n'

# TaskMaker is a module for generating task.
module TaskMaker
  class << self
    include Template
    def generator
      task_name = Umu::Inputter.input(I18n.t('task.make_name'))
      cover(1)
      show_command('task', task_name)
      make_action = Umu::Selector.single_choice(I18n.t('task.make_actions'))
      cover(1)
      actions = []
      while make_action
        action_name = Umu::Inputter.input(I18n.t('task.make_action_name'), true, actions)
        cover(1)
        actions << action_name
        cover(1)
        show_command('task', task_name, actions.join(' '))
        make_action = Umu::Selector.single_choice(I18n.t('task.make_action_continue'))
        cover(1)
      end

      is_make_options = Umu::Selector.single_choice(I18n.t('common.make_options'))
      cover(1)
      options = ''
      options = Umu::Inputter.input(I18n.t('common.add_option'), true) if is_make_options
      cover(1) if is_make_options
      command = command('task', task_name, actions.join(' '), options)
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
