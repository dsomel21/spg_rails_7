class Chhand < ApplicationRecord
  belongs_to :chapter
  belongs_to :chhand_type
  has_many :pauris, dependent: :destroy
  has_many :tuks, dependent: :destroy
end
