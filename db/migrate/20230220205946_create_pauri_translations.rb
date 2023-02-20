class CreatePauriTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :pauri_translations do |t|
      t.references :pauri, null: false, foreign_key: true, index: true
      t.references :chapter, null: false, foreign_key: true
      t.string :en_translation, null: false
      t.string :en_translator # Vidhiya Saagar, Manglacharan, Bhai Gurdas Education Trust, etc.

      t.timestamps
    end
  end
end
