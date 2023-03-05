# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'
require 'i18n'

# MailboxMaker is a module for generating mailbox.
module MailboxMaker
  class << self
    include Template
    def generator
      mailbox_name = Umu::Inputter.input(I18n.t('mailbox.make_name'))
      cover(1)
      show_command('mailbox', mailbox_name)
      is_make_options = Umu::Selector.single_choice(I18n.t('common.make_options'))
      cover(1)
      options = ''
      options = Umu::Inputter.input(I18n.t('common.add_name'), true) if is_make_options
      cover(1) if is_make_options
      command = command('mailbox', mailbox_name, options)
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
