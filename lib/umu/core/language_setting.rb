require 'yaml'
require 'i18n'
require_relative 'selector'
require_relative '../beautifica/beautifica'

I18n.load_path = Dir[File.join(File.dirname(__FILE__), '..', 'locales', '*.yml')]

module Umu
  # LanguageSetting is a module for setting language.
  class LanguageSetting
    LANG = {
      en: 'English',
      zh: '中文',
      ja: '日本語'
    }.freeze
    extend Template

    def self.setup_language
      umu_lang_path = File.join(Dir.pwd, '.umu_lang')

      save_language_choice(prompt_language) unless File.exist?(umu_lang_path)
      umu_lang = YAML.load_file(umu_lang_path)
      lang = umu_lang['language']
      I18n.locale = lang
    end

    def self.prompt_language
      logo

      item = Umu::Selector.radio(LANG.values, 'Please select a language:')
      LANG.key(item)
    end

    def self.save_language_choice(lang)
      umu_lang_path = File.join(Dir.pwd, '.umu_lang')
      umu_lang = {}
      umu_lang['language'] = lang
      File.write(umu_lang_path, umu_lang.to_yaml)
    end
  end
end
