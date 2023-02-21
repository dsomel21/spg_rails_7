class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.references :book, null: false, foreign_key: true, index: true
      t.integer :number, null: false, unique: true
      t.string :title, limit: 500
      t.string :vs_title
      t.string :vs_short_summary
      t.text :vs_long_summary
      t.text :artwork_url

      t.timestamps
    end
  end
end
