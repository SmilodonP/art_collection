require 'rails_helper'

RSpec.describe "the artworks show page" do
  describe 'the page displays the artworks information' do
  # As a visitor
  # When I visit /artworks/1 (where 1 is the id of an artwork in my database)
  # Then I see that artwork's title, artist, year made, and
  # And I do not see any of the other artworks in my database
    artist = Artist.create!(name: "Krrrl", birth_year: 0000, is_alive: true)
    artwork_1 = artist.artworks.create!(title: "This", year_made: 1987) 
    artwork_2 = artist.artworks.create!(title: "Is", year_made: 1988)
    
    it 'displays the title of the artwork' do
      visit "/artworks/#{artwork_1.id}"

      expect(page).to have_content(artwork_1.title)
      expect(page).to_not have_content(artwork_2.title)
    end
    
    it 'displays the name of the artist' do
      visit "/artworks/#{artwork_1.id}"

      expect(page).to have_content(artist.name)
      expect(page).to have_content(artist.name)
    end

    it 'displays the year the artwork was finished' do
      visit "/artworks/#{artwork_1.id}"
      save_and_open_page
      expect(page).to have_content(artwork_1.year_made)
      expect(page).to_not have_content(artwork_2.year_made)

    end
  end
end