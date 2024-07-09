require 'rails_helper'

RSpec.describe Artwork do
  it {should belong_to :artist}
end