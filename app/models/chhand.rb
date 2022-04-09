class Chhand < ApplicationRecord
  belongs_to :chapter
  belongs_to :chhand_type
  has_many :pauris, dependent: :destroy
  has_many :tuks, dependent: :destroy

  ###
  # @params chhand_blob: {
  #   CHHAND_NUMBER: {
  #     chhandPretext: string,
  #     chhandType: string,
  #     pauris: {
  #       PAURI_NUMBER: [{}]
  #     }
  #   }
  # }
  def self.handle_chhands_blob(chhands_blob, chapter)
    chhands_blob.each do |order_number, chhand_blob|
      create_individual_chhand(chhand_blob, order_number, chapter)
    end
  end

  # Wierd thing here is... the chhand_order isn't PROVIDED from the
  def self.create_individual_chhand(chhand_blob, order_number, chapter)
    chhand_type = ChhandType.find_by(chhand_name_unicode: chhand_blob['chhandType'])
    if chhand_type.nil?
      puts '🛑 do not have the chhand_name_english, or chhand_name_gs'
      chhand_type = ChhandType.create(chhand_name_unicode: chhand_blob['chhandType'])
    end

    chhand = chapter.chhands.create(
      order_number: order_number,
      chhand_type_id: chhand_type.id,
      prefix_unicode: chhand_blob['chhandPretext'].strip!
    )

    Pauri.handle_pauris_blob(chhand_blob['pauris'], chhand)
  end
end
