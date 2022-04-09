class Pauri < ApplicationRecord
  belongs_to :chhand, dependent: :destroy
  belongs_to :chapter, dependent: :destroy
  has_many :tuks, dependent: :destroy
end
