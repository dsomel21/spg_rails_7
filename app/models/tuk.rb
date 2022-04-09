class Tuk < ApplicationRecord
  belongs_to :chhand
  belongs_to :chhand_type
  belongs_to :chapter
  belongs_to :pauri



# Tuk.add_tuk(33, 20, 1, "ਚਾਰ ਘਰੀ ਇਕ ਜਾਮ ਲਰ੍ਯੋ ਬਲ ਬਾਹੁਨਿ ਤੇ ਬਹੁ ਬੀਰਨ ਕੋ।")
# Tuk.add_tuk(33, 20, 2, "ਬੀਧਤਿ ਗੇਰਤਿ, ਟੇਰਤਿ ਹੈਂ ਅਰਿ, ਜਾਚਤਿ ਕੇਤਿਕ ਨੀਰਨ ਕੋ ।")
# # Tuk.add_tuk(33, 20, 3, "ਸ਼੍ਰੀ ਗੁਰਦੇਵ ਪਿਤਾ ਢਿਗ ਭਾਖਤਿ ਥਭ ਮਨਿ굍ਦ ਥਿਰ੍ਯੋ ਤਿਸ ਜਾੲੇ¹।'")

def self.add_tuk(chapter_number, pauri_number, tuk_number, unicode)

  chapter = Chapter.find_by_number(chapter_number)

  pauri = chapter.pauris.find_by_number(pauri_number)

  if !pauri
    previous_pauri = chapter.pauris.find_by_number(pauri_number - 1)
    another_pauri = Pauri.find_by_number(pauri_number)

    pauri = Pauri.create(
      number: pauri_number,
      chhand_id: previous_pauri.chhand_id,
      chapter_id: chapter.id,
      signature_unicode: another_pauri.signature_unicode,
      signature_gs: another_pauri.signature_gs,
      signature_english: another_pauri.signature_english
    )
  end


  t = Tuk.new(
    line_number: tuk_number,
    content_unicode: unicode,
    chhand_id: pauri.chhand_id,
    chapter_id: pauri.chapter_id,
    chhand_type_id: pauri.chhand.chhand_type_id,
    pauri_id: pauri.id
  )
  t.save

  puts "t-----------"
  puts t
end



end




