class CreatePauris < ActiveRecord::Migration[7.0]
  def change
    create_table :pauris do |t|
      t.integer :number, null: false, unique: true
      t.references :chapter, null: false, foreign_key: true, index: true
      t.references :chhand, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
