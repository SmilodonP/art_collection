class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :year_made
      t.boolean :for_sale

      t.timestamps
    end
  end
end
