class Chapter < ApplicationRecord
  require 'json'

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
    blob = JSON.parse(File.read(path))
    Chapter.import_blob(blob)
  end

  def self.import_blob(blob)
    book_blob = blob['book']

    # Book.find_by(id: book_blob['id']).try(:destroy)
    book = Book.find_or_create_by!(
      id: book_blob['id'],
      book_order: book_blob['bookOrder'],
      title_gs: book_blob['titleGS'],
      title_transliteration_english: book_blob['titleEnglish'],
      description_english: book_blob['description_english']
    )
    handle_chapters_blob(book_blob['chapters'], book)
  end

  ###
  # @params: chapters_blob: {
  #   CHAPTER_NUMBER: {
  #     title_unicode
  #     title_gs
  #     title_transliteration_english
  #     number
  #     order_number
  #     chhands: { CHHAND_NUMBER: {}}
  #   }
  # }
  ###
  def self.handle_chapters_blob(chapters_blob, book)
    chapters_blob.each { |_, chapter_blob| create_individual_chapter(chapter_blob, book) }
  end

  def self.create_individual_chapter(chapter_blob, book)
    exp_order_number = chapter_blob['order_number']
    order_number = exp_order_number == 1 ? chapter_blob['number'] : exp_order_number

    chapter = book.chapters.find_or_create_by!(
      title_unicode: chapter_blob['titleUnicode'],
      title_gs: chapter_blob['title_gs'],
      title_transliteration_english: chapter_blob['titleEnglish'],
      number: chapter_blob['number'],
      order_number: order_number
    )

    puts "Destroying Chapter ID: #{chapter.id}'s Chhands."
    chapter.chhands.destroy
    Chhand.handle_chhands_blob(chapter_blob['chhands'], chapter)
  end
end