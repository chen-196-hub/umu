# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'

module Controller
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
      controller_name = Umu::Inputter.input('コントローラー名を入力してください (複数)')
      cover(1)
      puts "#=> rails generate controller #{controller_name}"
      make_actions = Umu::Selector.single_choice('アクション生成しますか？')
      cover(1)
      actions = []
      if make_actions
        actions = Umu::Selector.checkbox(ACTIONS, 'アクションを選択してください。')
        cover(1)
        cover(1)
        puts "#=> rails generate controller #{controller_name} #{actions.join(' ')}"
        if actions.include?('other')
          make_action = true
          actions.delete('other')
          while make_action
            original_action_name = Umu::Inputter.input('アクション名を入力してください', true, actions)
            actions << original_action_name
            cover(2)
            puts "#=> rails generate controller #{controller_name} #{actions.join(' ')}"
            make_action = Umu::Selector.single_choice('作り続けますか？')
            cover(1)
          end
        end
      end
      is_make_options = Umu::Selector.single_choice('オプションを追加しますか？')
      options = ''
      cover(1)
      options = Umu::Inputter.input('オプションを入力してください', true) if is_make_options
      cover(1) if is_make_options
      command = "rails generate controller #{controller_name} #{actions.join(' ')} #{options}"
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
