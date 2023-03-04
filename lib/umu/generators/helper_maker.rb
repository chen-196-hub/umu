# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'

# HelperMaker is a module for generating helper.
module HelperMaker
  class << self
    include Template
    def generator
      helper_name = Umu::Inputter.input('ヘルパー名を入力してください (例：helper_name)')
      cover(1)
      show_command('helper', helper_name)
      is_make_options = Umu::Selector.single_choice('オプションを追加しますか？')
      cover(1)
      options = ''
      options = Umu::Inputter.input('オプションを入力してください', true) if is_make_options
      cover(1) if is_make_options
      command = command('helper', helper_name, options)
      cover(1)
      puts command
      confirm_content = '上記コマンド実行しますか？'
      run_command = Umu::Selector.single_choice(confirm_content)
      cover(1)
      puts confirm_content + (run_command ? 'はい' : 'いいえ')
      system(command) if run_command
      true
    end
  end
end
