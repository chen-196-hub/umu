require_relative '../../lib/umu/core/language_setting'

RSpec.describe Umu::LanguageSetting do
  LANG_PATH = File.join(File.dirname(__FILE__), '../..', '.umu_lang')

  after(:each) do
    File.delete(LANG_PATH) if File.exist?(LANG_PATH)
  end
  describe '.setup_language' do
    it 'sets up the language' do
      allow(Umu::LanguageSetting).to receive(:prompt_language).and_return(:en)
      I18n.locale = :ja
      expect(I18n.locale).not_to eq(:en)
      Umu::LanguageSetting.setup_language
      expect(I18n.locale).to eq(:en)
    end
  end

  describe '.prompt_language' do
    it 'prompts the user to select a language' do
      allow(Umu::Selector).to receive(:radio).and_return('English')
      expect(Umu::LanguageSetting.prompt_language).to eq(:en)
    end
  end

  describe '.save_language_choice' do
    it 'saves the language choice to a file' do
      lang = :ja
      Umu::LanguageSetting.save_language_choice(lang)
      expect(YAML.load_file(Umu::LanguageSetting::LANG_PATH)['language']).to eq(lang)
    end
  end

  describe '.change_language' do
    it 'deletes the language file and sets up the language again' do
      allow(Umu::LanguageSetting).to receive(:prompt_language).and_return(:zh)
      Umu::LanguageSetting.change_language
      expect(I18n.locale).to eq(:zh)
      expect(File.exist?(Umu::LanguageSetting::LANG_PATH)).to be(true)
    end
  end
end