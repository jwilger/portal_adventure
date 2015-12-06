require 'portal_adventure/location'

RSpec.describe PortalAdventure::Location do
  it 'has a description' do
    expect(subject.description).to eq "You are in a room with a description."
  end
end
