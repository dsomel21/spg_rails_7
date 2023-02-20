class CreateChapterFootnotes < ActiveRecord::Migration[7.0]
  def change
    create_table :chapter_footnotes do |t|
      t.references :chapter, null: false, foreign_key: true, index: true
      t.text :dr_vir_singh_footnotes, limit: 25000
      t.text :vs_footnotes, limit: 25000
      t.boolean :is_endnote, default: false # Does this chapter_footnote appear at the END?
      
      t.timestamps
    end
  end
end
