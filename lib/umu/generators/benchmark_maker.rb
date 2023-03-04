require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'

# BenchmarkMaker is a module for generating benchmark.
module BenchmarkMaker
  class << self
    include Template
    def generator
      benchmark_name = Umu::Inputter.input('ベンチマーク名を入力してください (例：benchmark_name)')
      cover(1)
      show_command('benchmark', benchmark_name)
      confirm_content = '上記コマンドを実行しますか？'
      run_command = Umu::Selector.single_choice(confirm_content)
      cover(1)
      puts confirm_content + (run_command ? 'はい' : 'いいえ')
      system(command) if run_command
      true
    end
  end
end
