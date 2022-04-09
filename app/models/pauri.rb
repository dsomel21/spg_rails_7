class Pauri < ApplicationRecord
  belongs_to :chhand
  belongs_to :chapter
  has_many :tuks, dependent: :destroy
end



# Book
# Chapter.last.chhands.last.pauris.last.tuks.create!(
#   line_number: 1, content_unicode: "ਪਾਰਬ੍ਰਹਮ! ਪਰਮਾਤਮਾ! ਬ੍ਯਾਪਕ ਸਕਲ ਸਮਾਨ!",
#   chhand_type_id: 1 ,
#   chhand_id: Chhand.last.id,
#   chapter_id: Chapter.last.id
# )
