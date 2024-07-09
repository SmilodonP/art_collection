# User Story 1, Artist Index 

require 'rails_helper'

RSpec.describe 'Artists Index:'do
  describe "As a visitor:" do
    describe "When I visit '/artists'" do
      artist_1 = Artist.create!(name: "Krrrl", birth_year: 0000, is_alive: true)
      artist_2 = Artist.create!(name: "Steve The Dude", birth_year: 2000, is_alive: true)
      it "I see the name of each artist recorded in the system" do
        visit "/artists"

        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
      end
    end
  end
end