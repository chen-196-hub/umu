# frozen_string_literal: true

module Color
  COLORS = {
    black: 30,
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    magenta: 35,
    syan: 36,
    white: 37
  }.freeze
  COLORS.map do |k, v|
    define_method(k) do |str|
      "\e[#{v}m#{str}\e[0m"
    end
  end
end
