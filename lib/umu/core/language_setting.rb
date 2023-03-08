require 'yaml'
require 'i18n'
require_relative 'selector'
require_relative '../beautifica/beautifica'

I18n.load_path = Dir[File.join(File.dirname(__FILE__), '..', 'locales', '*.yml')]

module Umu
  # LanguageSetting is a module for setting language.
  class LanguageSetting
    extend Template
    LANG = {
      en: 'English',
      zh: '中文',
      ja: '日本語'
    }.freeze
    LANG_PATH = File.join(File.dirname(__FILE__), '../../..', '.umu_lang')

    def self.setup_language
      save_language_choice(prompt_language) unless File.exist?(LANG_PATH)
      umu_lang = YAML.load_file(LANG_PATH)
      lang = umu_lang['language']
      I18n.locale = lang
    end

    def self.prompt_language
      logo
      content = 'Please select a language:'
      item = Umu::Selector.radio(LANG.values, content)
      cover(1)
      puts "#{content} #{green(item)}"
      LANG.key(item)
    end

    def self.save_language_choice(lang)
      umu_lang = {}
      umu_lang['language'] = lang
      File.write(LANG_PATH, umu_lang.to_yaml)
    end

    def self.change_language
      File.exist?(LANG_PATH) ? File.delete(LANG_PATH) : nil
      setup_language
    end
  end
end
