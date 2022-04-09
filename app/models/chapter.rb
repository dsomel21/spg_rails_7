class Chapter < ApplicationRecord
  belongs_to :book
  has_many :chhands, dependent: :destroy
  has_many :pauris, dependent: :destroy
  has_many :tuks, through: :pauris, dependent: :destroy
  has_many :chapter_kathas, dependent: :destroy
  has_many :kathas, through: :chapter_kathas, dependent: :destroy

  def self.import(file)
    begin
      file += '.json' unless file.ends_with?('.json')
      path = Dir.glob("../alex-parse-spg/output/#{file}").try(:first)
    rescue SystemCallError => e
      puts "Could not find the file. Make sure it exists in the '../alex-parse-spg/output/' directory."
      throw e
    end
    puts "Path is #{path}"
    blob = JSON.parse(File.read(path))
    Chapter.import_chapter_json(blob)
  end

  def self.import_chapter_json(blob)
    book_blob = blob['book']
    
    puts "book_blob['id'] #{book_blob['id']}"
    Book.destroy(book_blob['id'])
    # book = Book.create(
    #   id: book_blob['id'],
    #   book_order: book_blob['book_order'],
    #   title_gs: book_blob['title_gs'],
    #   title_transliteration_english: book_blob['title_transliteration_english'],
    #   description_english: book_blob['description_english']
    # )

    # book.chapters.destroy_all
  end
end