class Tuk < ApplicationRecord
  belongs_to :chhand
  belongs_to :chhand_type
  belongs_to :chapter
  belongs_to :pauri
  require ("pry")
  require("csv")

  def self.import_translations
    require("csv")
    csv = CSV.parse(File.read("final_csv.csv"), headers: true)

    csv.each do |row|

      missing_database_pauris = []

      if (row["Chapter:"])
        chapter = Chapter.find_by_number(row["Chapter:"])
        # if chapter.number == 35 || chapter.number == 36 || chapter.number == 37 || chapter.number == 38 || chapter.number == 39 || chapter.number == 40 || chapter.number == 41
        # if chapter.number == 31 || chapter.number == 32 || chapter.number == 33 
        if chapter.number == 34 
          pauri = chapter.pauris.find_by_number(row["Pauri:"])


          # Split the CSV Tuks
          # trans_array = row["Rough Translation:"].to_s.split("\r\n")
          # if trans_array.count <= 1
          #   trans_array = row["Rough Translation:"].to_s.split("\n")
          # end

          # Maybe Gurpartaap Fix??
          # if trans_array.count <= 1
            trans_array = row["Rough Translation:"].to_s.split(";")
          # end


          # if trans_array.count <= 1
          #   trans_array = row["Rough Translation:"].to_s.split(".")
          # end

          # if pauri.number == 25
          #   binding.pry
          # end

          puts "trans_array"
          puts trans_array

          i = 1
          trans_array.each do |translation|
            if translation.length < 255 
              tuk = pauri.tuks.find_by_line_number(i)
              if !tuk
                missing_database_pauris << row
              else 
                puts row
                tuk.translation = translation
                tuk.save
              end
            end
            i += 1
          end
        end
      end
    end
  end



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




