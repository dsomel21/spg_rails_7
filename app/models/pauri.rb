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
  def self.handle_pauris_blob(pauris_blob, chhand)
    pauris_blob.each do |pauris_blob, pauri_number|
      create_pauri_content(pauris_blob, pauri_number, chhand)
    end
  end

  # {
  #     orderNumber
  #     tuk
  #     translationEnglish
  #     footnote
  #     customFootnote
  #   }
  def self.create_pauri_content(pauro_blob, pauri_number, chhand)
    Pauri.create_pauris(chhand_blob['pauris'], chhand)
  end
end