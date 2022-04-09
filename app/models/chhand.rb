class Chhand < ApplicationRecord
  belongs_to :chapter, dependent: :destroy
  belongs_to :chhand_type, dependent: :destroy
  has_many :pauris, dependent: :destroy
  has_many :tuks, dependent: :destroy
end
