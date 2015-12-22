require 'portal_adventure/universe'

RSpec.describe PortalAdventure::Universe do
  subject {
    described_class.new(player_interface: player_interface,
                        starting_location: starting_location,
                        default_character: default_character)
  }

  let(:player_interface) {
    instance_double('PortalAdventure::PlayerInterface',
                    process_next_command: nil,
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
    it 'tells the active character to inspect its location' do
      subject.run
      expect(first_player_character).to have_received(:inspect_location)
        .with(tell: player_interface)
    end

    it 'tells the player interface to process the next command' do
      subject.run
      expect(player_interface).to have_received(:process_next_command)
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
