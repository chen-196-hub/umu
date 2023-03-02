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
    boolean ? "(○) #{blue(str)}" : "( ) #{str}"
  end

  def hover(boolen, str)
    boolen ? green(str) : str
  end
  module_function :pointer, :checker, :hover, :cover
end
