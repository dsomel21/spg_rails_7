class Chapter < ApplicationRecord
  belongs_to :book
  has_many :chhands, dependent: :destroy
  has_many :pauris, dependent: :destroy
  has_many :tuks, through: :pauris, dependent: :destroy
  has_many :chapter_kathas, dependent: :destroy
  has_many :kathas, through: :chapter_kathas, dependent: :destroy
end