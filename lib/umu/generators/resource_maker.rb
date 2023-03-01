
require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'

module ResourceMaker
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
      resource_name = Umu::Inputter.input('リソース名を入力してください (単数)')
      cover(1)
      puts "#=> rails generate resource #{resource_name}"
      is_make_column = Umu::Selector.single_choice('カラム生成しますか？')
      cover(1)
      columns = []
      while is_make_column
        columns << make_colum
        puts "#=> rails generate resource #{resource_name} #{columns.join(' ')}"
        is_make_column = Umu::Selector.single_choice('作り続けますか？')
        cover(1)
      end
      puts "#=> rails generate resource #{resource_name} " + columns.join(' ')
      cover(1)

      is_make_options = Umu::Selector.single_choice('オプションを追加しますか？')
      cover(1)
      options = ''
      options = Umu::Inputter.input('オプションを入力してください', true) if is_make_options
      cover(1) if is_make_options

      command = "rails generate resource #{resource_name} " + "#{columns.join(' ')}" + " #{options}"
      cover(1)
      puts command
      confirm_content = '上記コマンド実行しますか？'
      run_command = Umu::Selector.single_choice(confirm_content)
      cover(1)
      puts confirm_content + (run_command ? 'はい' : 'いいえ')
      system(command) if run_command
      true
    end

    def make_colum
      colum_name = Umu::Inputter.input('カラム名を入力してください')
      cover(1)
      type = Umu::Selector.radio(COLUMN_TYPE, 'タイプを選んでください')
      cover(2)
      "#{colum_name}:#{type}"
    end
  end
end