require_relative '../core/inputter'
require_relative '../core/selector'
require_relative '../beautifica/beautifica'
require 'i18n'

# BenchmarkMaker is a module for generating benchmark.
module BenchmarkMaker
  class << self
    include Template
    def generator
      benchmark_name = Umu::Inputter.input(I18n.t('benchmark.make_name'))
      cover(1)
      show_command('benchmark', benchmark_name)
      confirm_content = I18n.t('common.run_command')
      run_command = Umu::Selector.single_choice(confirm_content)
      cover(1)
      command = command('benchmark', benchmark_name)
      puts confirm_content + (run_command ? I18n.t('affirm') : I18n.t('deny'))
      system(command) if run_command
      true
    end
  end
end
