# User Story 3
require 'rails_helper'

RSpec.describe "Artworks Index:" do
  describe "As a visitor:" do
    describe "When I visit '/artworks'" do
      artist_1 = Artist.create!(name: "Krrrl", birth_year: 0000, is_alive: true)
      artist_2 = Artist.create!(name: "Not This", birth_year: 2020, is_alive: true)
      artwork_1 = artist_1.artworks.create!(title: "This", year_made: 1987, for_sale: false) 
      artwork_2 = artist_1.artworks.create!(title: "Is", year_made: 1988, for_sale: false)
      artwork_3 = artist_2.artworks.create!(title: "Art", year_made: 2021, for_sale: true)
    
      it 'I see the artworks titles,' do
        visit "/artworks"

        expect(page).to have_content(artwork_1.title)
        expect(page).to have_content(artwork_2.title)
      end
      
      it 'I see the artworks artists,' do
        visit "/artworks"

        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
      end

      it 'I see the year the artworks were made' do
        visit "/artworks/"

        expect(page).to have_content(artwork_1.year_made)
        expect(page).to have_content(artwork_2.year_made)
      end

      it 'I see if a piece of artworks is for sale' do
        visit "/artworks/"

        expect(page).to have_content(artwork_1.for_sale)
        expect(page).to have_content(artwork_2.for_sale)
      end
    end
  end
end