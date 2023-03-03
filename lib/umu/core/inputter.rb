# frozen_string_literal: true

require_relative 'validation'
require_relative '../beautifica/beautifica'

module Umu
  # Inputter is a module for inputting.
  class Inputter
    extend Template
    def self.input(content, has_vaild = false, check_target = [])
      puts content.to_s
      input_val = gets
      is_empty = input_val.chomp == ''
      while is_empty
        cover(2)
        puts "\e[1A"
        puts "#{content} #{red('必須項目です')}"
        input_val = gets
        is_empty = input_val.chomp == ''
      end

      if has_vaild
        is_overlap = Umu::Validation.check_overlap(check_target, input_val.chomp)
        while is_overlap
          cover(2)
          puts "\e[1A"
          puts "#{content} #{red("#{input_val.chomp}は重複です")}"
          input_val = gets

          is_empty = input_val.chomp == ''
          while is_empty
            cover(2)
            puts "\e[1A"
            puts "#{content} #{red('必須項目です')}"
            input_val = gets
            is_empty = input_val.chomp == ''
          end

          is_overlap = Umu::Validation.check_overlap(check_target, input_val.chomp)
        end
      end
      puts "\e[2A"
      input_val.chomp
    end
  end
end
