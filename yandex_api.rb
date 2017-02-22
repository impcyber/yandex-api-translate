require './api'

Dir["./methods/*.rb"].each { |file| require file } # Hack from github

class YandexApiTranslate

  def initialize(api_key)
   @api_key = api_key
  end

  def get_langs
   data = Methods::GetLangs.run(api_key)
   data['dirs']
  end

  def detect(text)
   data = Methods::DetectLangs.run(api_key, text)
   data['lang']
  end

  def translate(text, from="en", to = "ru")
   data = Methods::Translate.run(api_key, text, from, to)
   data['text']
  end

private

attr_reader :api_key

end
