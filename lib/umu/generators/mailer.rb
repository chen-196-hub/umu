# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'

module Mailer
  class << self
    include Template
    def generator
      mailer_name = Umu::Inputter.input('メーラー名を入力してください (例：CreditCard)')
      cover(1)
      puts "#=> rails generate mailer #{mailer_name}"
      make_action = Umu::Selector.single_choice('アクションを追加しますか？')
      cover(1)
      actions = []
      while make_action
        action_name = Umu::Inputter.input('アクション名を入力してください (例：subscribed)')
        cover(1)
        actions << action_name
        cover(1)
        puts "#=> rails generate channel #{mailer_name} #{actions.join(' ')}"
        make_action = Umu::Selector.single_choice('追加続きますか？')
        cover(1)
      end
      is_make_options = Umu::Selector.single_choice('オプションを追加しますか？')
      cover(1)
      options = ''
      options = Umu::Inputter.input('オプションを入力してください', true) if is_make_options
      cover(1) if is_make_options
      command = "rails generate mailer #{mailer_name}" + " #{actions.join(' ')}" + " #{options}"
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
