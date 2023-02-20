class CreateChhands < ActiveRecord::Migration[7.0]
  def change
    create_table :chhands do |t|
      t.references :chapter, null: false, foreign_key: true, index: true
      t.references :chhand_type, null: false, foreign_key: true, index: true
      t.integer :sequence, null: false, unique: true
      
      # Sometimes, a chhand will have a vaak. This is similar to how Chaupai Sahib starts with:
      # ਕਬਯੋ ਬਾਚ ਬੇਨਤੀ ॥ ਚੌਪਈ
      # Thus, in SPG, there are some chhands that begin with a Baach / Vaak:
      # For example:
      # In Nanak Prakash 1, Ansu 35 we have a ਦੁਵੱਯਾ ਛੰਦ with a "ਸ਼੍ਰੀ ਬਾਲਾ ਸੰਧੂਰੁ ਵਾਚ"
      # You can find this in the puratan Pothi as well:
      # http://www.panjabdigilib.org/webuser/searches/displayPageContent.jsp?ID=12839&page=247&CategoryID=3&Searched=W3GX
      t.string :vaak
      t.timestamps
    end
  end
end
