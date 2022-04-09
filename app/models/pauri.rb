class Pauri < ApplicationRecord
  belongs_to :chhand
  belongs_to :chapter
  has_many :tuks, dependent: :destroy

  ###
  # @params pauri_blob: {
  #   PAURI_NUMBER: [{
  #     orderNumber
  #     tuk
  #     translationEnglish
  #     footnote
  #     customFootnote
  #   }]
  # }
  ###
  def self.handle_pauris_blob(pauris_blob, chhand)
    pauris_blob.each do |pauri_number, pauri_blob|
      create_pauri_content(pauri_blob, pauri_number, chhand)
    end
  end

  ###
  # @params: {
  #     orderNumber
  #     tuk
  #     translationEnglish
  #     footnote
  #     customFootnote
  #   }
  ###
  def self.create_pauri_content(pauri_blob, pauri_number, chhand)
    # TODO: Make it so that you can update a specific pauri in a chhand
    # 🛑 Note: We are missing signature_unicode... Might not be a problem though
    pauri = chhand.pauris.create!(
      chapter_id: chhand.chapter_id,
      number: pauri_number,
      signature_gs: "]#{pauri_number}]",
      signature_english: "||#{pauri_number}||"
    )

    pauri_blob.map do |tuk|
      pauri.tuks.create!(
        line_number: tuk['orderNumber'],
        chhand_id: chhand.id,
        chhand_type_id: chhand.chhand_type_id,
        chapter_id: chhand.chapter_id,
        content_unicode: tuk['tuk'],
        # content_gs: string,
        # content_transliteration_english: string,
        first_letters: tuk['tuk'].split(' ').map(&:first).join(),
        # vishraams: json,
        # thamkis: json,
        translation: tuk['translationEnglish']
      )
    end
  end
end
