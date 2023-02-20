class CreateTuks < ActiveRecord::Migration[7.0]
  def change
    create_table :tuks do |t|
      t.references :chapter, null: false, foreign_key: true, index: true
      t.references :chhand, null: false, foreign_key: true, index: true
      t.references :pauri, null: false, foreign_key: true, index: true
      t.integer :sequence, null: false
      t.string :content, null: false # Gurmukhi Unicode
      t.string :original_content     # Raw parsed content

      t.timestamps
    end
  end
end
