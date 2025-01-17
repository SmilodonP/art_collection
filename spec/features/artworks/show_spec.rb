# User Story 4
require 'rails_helper'

RSpec.describe "Artworks Show:" do
  describe "As a visitor:" do
    describe 'When I visit /artworks/1(where 1 is the id of an artwork in my database)' do
      artist_1 = Artist.create!(name: "Krrrl", birth_year: 0000, is_alive: true)
      artist_2 = Artist.create!(name: "Not This", birth_year: 2020, is_alive: true)
      artwork_1 = artist_1.artworks.create!(title: "This", year_made: 1987, for_sale: false) 
      artwork_2 = artist_1.artworks.create!(title: "Is", year_made: 1988, for_sale: false)
      artwork_3 = artist_2.artworks.create!(title: "Art", year_made: 2021, for_sale: true)
      
      it 'I see that artworks title' do
        visit "/artworks/#{artwork_1.id}"

        expect(page).to have_content(artwork_1.title)
        expect(page).to_not have_content(artwork_2.title)
      end
      
      it 'I see that artworks artist' do
        visit "/artworks/#{artwork_1.id}"

        expect(page).to have_content(artist_1.name)
        expect(page).to_not have_content(artist_2.name)
      end

      it 'I see that artworks year made' do
        visit "/artworks/#{artwork_1.id}"

        expect(page).to have_content(artwork_1.year_made)
        expect(page).to_not have_content(artwork_2.year_made)
      end
    end
  end
end