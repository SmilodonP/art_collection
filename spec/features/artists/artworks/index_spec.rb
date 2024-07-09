# User Story 5, Artist Artworks Index 
require 'rails_helper'

RSpec.describe "Artists Artworks Index:" do
  describe "As a visitor:" do
    describe "When I visit /artists/artist.id/artworks" do
      @krrrl = Artist.create!(name: "Krrrl", birth_year: 0000, is_alive: true)
      @not = Artist.create!(name: "Not Krrrl", birth_year: 2020, is_alive: true)
      @this = @krrrl.artworks.create!(title: "This", year_made: 1987, for_sale: false) 
      @is = @krrrl.artworks.create!(title: "Is", year_made: 1988, for_sale: false)
      @art = @not.artworks.create!(title: "Art", year_made: 2021, for_sale: true)

      it "I see each artwork that is associated with that artist" do
        visit "/artists/#{@krrrl.id}/artworks"

        expect(page).to have_content(@this)
        expect(page).to have_content(@is)
        expect(page).to_not have_content(@art)
      end

      it "I see each artworks attributes" do
        visit "/artists/#{@krrrl.id}/artworks"

        expect(page).to have_content(@this.title)
        expect(page).to have_content(@is.title)
        expect(page).to_not have_content(@art.title)

        expect(page).to have_content(@this.year_made)
        expect(page).to have_content(@is.year_made)
        expect(page).to_not have_content(@art.year_made)

        expect(page).to have_content(@this.for_sale)
        expect(page).to have_content(@is.for_sale)
        expect(page).to_not have_content(@art.for_sale)
      end
    end
  end
end