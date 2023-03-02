# frozen_string_literal: true

require 'io/console'
require_relative '../beautifica/beautifica'

module Umu
  # Selector is a module for selecting items.
  class Selector
    extend Template
    def self.radio(opts = [], content = '')
      puts content
      options = opts.map(&:to_s)

      options.each_with_index do |x, idx|
        print pointer(idx.zero?)
        puts hover(idx.zero?, x)
      end
      radio_interactive_menu(options)
    end

    def self.single_choice(content = '')
      choice = radio(%w[Yes No], content)
      case choice
      when 'Yes'
        true
      when 'No'
        false
      else
        false
      end
    end

    def self.checkbox(opts = [], content = '')
      puts content
      options = opts.map(&:to_s)

      options.each_with_index do |x, idx|
        print pointer(idx.zero?)
        puts "( ) #{x}"
      end

      checkbox_interactive_menu(options)
    end

    class << self
      def radio_interactive_menu(options)
        index = 0
        while (key = $stdin.getch) != "\C-c"
          if key == "\e"
            second_key = $stdin.getch
            if second_key == '['
              key = $stdin.getch
              case key
              when 'A', 'D'
                index -= 1 if index != 0
              when 'B', 'C'
                index += 1 if index < (options.size - 1)
              else
                "esc: [#{key}"
              end
              puts "\e[#{options.size + 1}A"
              options.each_with_index do |x, idx|
                print pointer(idx == index)
                puts hover(idx == index, x)
              end
            else
              key = "esc: #{second_key}"
            end
          end
          next unless key == "\r"

          cover(options.size)
          return options[index]
        end
      end

      def checkbox_interactive_menu(options)
        return [] if options.empty?

        index = 0
        ary = []
        while (key = $stdin.getch) != "\C-c"
          if key == "\e"
            second_key = $stdin.getch

            if second_key == '['
              key = $stdin.getch
              case key
              when 'A', 'D'
                index -= 1 if index != 0
              when 'B', 'C'
                index += 1 if index < (options.size - 1)
              else
                "esc: [#{key}"
              end
              puts "\e[#{options.size + 1}A"
              options.each_with_index do |x, idx|
                print pointer(idx == index)
                puts checker(ary.include?(idx), x)
              end
            else
              key = "esc: #{second_key}"
            end
          end
          if key == ' '
            ary.include?(index) ? ary.delete(index) : (ary << index)
            puts "\e[#{options.size + 1}A"
            options.each_with_index do |x, idx|
              print pointer(idx == index)
              puts checker(ary.include?(idx), x)
            end
          end
          next unless key == "\r"

          check_items = ary.sort.map { |x| options[x] }
          cover(options.size)
          return check_items
        end
      end
    end
  end
end
