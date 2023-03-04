# frozen_string_literal: true

require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'

# JobMaker is a module for generating job.
module JobMaker
  class << self
    include Template
    def generator
      job_name = Umu::Inputter.input('ジョブ名を入力してください (例：job_name)')
      cover(1)
      show_command('job', job_name)
      is_make_options = Umu::Selector.single_choice('オプションを追加しますか？')
      cover(1)
      options = ''
      options = Umu::Inputter.input('オプションを入力してください', true) if is_make_options
      cover(1) if is_make_options
      command = command('job', job_name, options)
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
