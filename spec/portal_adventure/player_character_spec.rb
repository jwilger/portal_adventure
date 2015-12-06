require 'portal_adventure/player_character'

RSpec.describe PortalAdventure::PlayerCharacter do
  subject {
    described_class.new(location: current_location)
  }

  let(:current_location) {
    instance_double('PortalAdventure::Location',
                    description: location_description)
  }

  let(:location_description) { "You are in a room full of emptiness." }

  describe '#inspect_location' do
    it 'provides the current location description to the response target' do
      response_target = instance_double('PortalAdventure::PlayerInterface',
                                        handle_location_description: nil)

      subject.inspect_location(tell: response_target)

      expect(response_target).to have_received(:handle_location_description)
        .with(location_description)
    end
  end
end
