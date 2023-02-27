# frozen_string_literal: true

module Umu
  class Validation
    # 重複チェック
    def self.check_overlap(check_target = [], items = '')
      check_target.include?(items)
    end
  end
end
