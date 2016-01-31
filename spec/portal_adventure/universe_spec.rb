require 'portal_adventure/universe'

RSpec.describe PortalAdventure::Universe do
  let(:default_player_character) {
    instance_double('PortalAdventure::PlayerCharacter', look: nil)
  }

  subject {
    described_class.new(starting_character: default_player_character)
  }

  it 'sets the active character to a new PlayerCharacter by default' do
    expect(subject.active_character).to eq(default_player_character)
  end

  describe '#look' do
    it 'forwards the look command to the active character' do
      output_target = instance_double('PortalAdventure::PlayerInterface')
      subject.look(output_target: output_target)
      expect(subject.active_character).to have_received(:look)
        .with(output_target: output_target)
    end
  end
end
