class Book < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :tuks, through: :chapters, dependent: :destroy
end
