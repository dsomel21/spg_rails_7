class CreateSamaptis < ActiveRecord::Migration[7.0]
  
  ###
  # This table is for the "ਇਤਿ ਸ਼੍ਰੀ ਗੁਰ ਪ੍ਰਤਾਪ ਸੂਰਜ ਗ੍ਰਿੰਥੇ..." content
  # Which comes up at the end of each chapter.
  # For example:
  # > "ਇਤਿ ਸ਼੍ਰੀ ਗੁਰ ਪ੍ਰਤਾਪ ਸੂਰਜ ਗ੍ਰਿੰਥੇ ਦੁਤਿਯ ਰਾਸੇ 'ਸਿੱਖ ਵਾਕ ਅਕਬਰ' ਪ੍ਰਸੰਗ ਬਰਨਨੰ ਨਾਮ ਖਸ਼ਟਮੇ ਅੰਸੂ ॥੬॥"
  ###
  def change
    create_table :samaptis do |t|
      t.references :chapter, null: false, foreign_key: true, index: true
      t.string :line, null: false # Gurmukhi Unicode
      t.string :vs_line           # English translation

      t.timestamps
    end
  end
end
