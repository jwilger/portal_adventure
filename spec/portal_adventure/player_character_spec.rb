require 'portal_adventure/player_character'

RSpec.describe PortalAdventure::PlayerCharacter do
  describe '#look' do
    let(:current_location) {
      instance_double('PortalAdventure::Location', describe: nil)
    }

    subject {
      described_class.new(starting_location: current_location)
    }

    it 'tells the current location to describe itself to the output target' do
      output_target = instance_double('PortalAdventure::PlayerInterface')
      subject.look(output_target: output_target)
      expect(current_location).to have_received(:describe).with(to: output_target)
    end
  end
end
