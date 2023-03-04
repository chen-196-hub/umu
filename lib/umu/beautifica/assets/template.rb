# frozen_string_literal: true

require_relative 'color'
# Template module is a module for stringIO.
module Template
  include Color
  def pointer(boolean)
    boolean ? ' > ' : '   '
  end

  def cover(num)
    puts "\e[#{num}A\e[0J\e[1A"
  end

  def checker(boolean, str)
    boolean ? "(○) #{syan(str)}" : "( ) #{str}"
  end

  def hover(boolen, str)
    boolen ? green(str) : str
  end

  def command(generator_name, target_name = '', sub_items = '', options = '')
    target_name = " #{target_name}" unless target_name.empty?
    sub_items = " #{sub_items}" unless sub_items.empty?
    options = " #{options}" unless options.empty?
    "rails generate #{generator_name}" + target_name + sub_items + options
  end

  def show_command(generator_name, target_name = '', sub_items = '', options = '')
    puts green('>') + " #{command(generator_name, target_name, sub_items, options)}"
  end

  module_function :pointer, :checker, :hover, :cover, :show_command, :command
end
