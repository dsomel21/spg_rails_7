class Book < ApplicationRecord
  has_many :chapters, dependent: :destroy
end
