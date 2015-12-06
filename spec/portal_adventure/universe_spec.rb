require 'portal_adventure/universe'

RSpec.describe PortalAdventure::Universe do
  subject {
    described_class.new(player_interface: player_interface,
                        starting_location: starting_location,
                        default_character: default_character)
  }

  let(:player_interface) {
    instance_double('PortalAdventure::PlayerInterface',
                    handle_location_description: nil)
  }

  let(:starting_location) { instance_double('PortalAdventure::Location') }

  let(:room_description) { "You find yourself in a vast, empty space." }

  let(:first_player_character) {
    instance_double('PortalAdventure::PlayerCharacter', 
                    inspect_location: nil)
  }

  let(:default_character) { ->(location:) { first_player_character } }

  describe '#run' do
    it 'describes the first room to the player' do
      allow(first_player_character).to receive(:inspect_location) do |args|
        args[:tell].handle_location_description room_description
      end

      subject.run
      expect(player_interface).to have_received(:handle_location_description)
        .with(room_description)
    end
  end

  describe '#active_character' do
    context 'at the start of a new game' do
      it 'is a new player character' do
        expect(subject.active_character).to eq first_player_character
      end
    end
  end
end
