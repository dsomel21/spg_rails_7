class CreatePauriFootnotes < ActiveRecord::Migration[7.0]
  def change
    create_table :pauri_footnotes do |t|
      t.references :pauri_id, null: false, foreign_key: true, index: true
      t.text :dr_vir_singh_footnote # Eventually, we would want this to be Rich Text / Markdown, etc. 
      t.text :vs_footnote
      
      t.timestamps
    end
  end
end
