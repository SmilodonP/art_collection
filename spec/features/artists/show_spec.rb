# User Story 2
require 'rails_helper'

RSpec.describe "Artist Show:" do
  describe "As a visitor:" do
    describe "When I visit /artists/1 (where 1 is the id of an artist in my database)" do
      artist_1 = Artist.create!(name: "Krrrl", birth_year: 0000, is_alive: true)
      artist_2 = Artist.create!(name: "Not This", birth_year: 2020, is_alive: false)

      it "I see the name of the artist with that id" do
        visit "/artists/#{artist_1.id}"

        expect(page).to have_content(artist_1.name)
        expect(page).to_not have_content(artist_2.name)
      end
      
      it "I see the year that the artist was born in" do
        visit "/artists/#{artist_1.id}"

        expect(page).to have_content(artist_1.name)
        expect(page).to_not have_content(artist_2.name)
      end

      it "I see if the artist is still alive" do
        visit "/artists/#{artist_1.id}"

        expect(page).to have_content(artist_1.is_alive)
        expect(page).to_not have_content(artist_2.is_alive)
      end      
    end
  end
end