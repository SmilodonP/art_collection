require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :artworks}
end