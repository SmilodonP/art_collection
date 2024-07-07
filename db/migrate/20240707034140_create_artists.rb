class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :birth_year
      t.boolean :is_alive

      t.timestamps
    end
  end
end
