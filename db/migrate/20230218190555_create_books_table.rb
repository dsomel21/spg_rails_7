class CreateBooksTable < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :sequence, :null => false
      t.string :title, :null => false   # Gurmuhki Unicode 
      t.string :vs_title                # The title written in English (by Vidhiya Saagar)
      t.string :vs_short_summary        # Short summary (for Google crawlers, etc. 150 characters is best)
      t.text :vs_synopsis, limit: 5000  # Long summary
      t.text :artwork_url
      
      t.timestamps
    end
  end
end
