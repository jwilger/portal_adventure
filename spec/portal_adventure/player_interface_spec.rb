require 'portal_adventure/player_interface'

RSpec.describe PortalAdventure::PlayerInterface do
  let(:universe) {
    instance_double('PortalAdventure::Universe', look: nil)
  }

  let(:output) { instance_double('IO', puts: nil, print: nil) }

  subject {
    described_class.new(universe, output: output)
  }

  it 'immediately sends the Look command to the universe on start-up' do
    expect(universe).to have_received(:look).with(output_target: subject)
  end

  describe '#handle_location_description' do
    it 'renders the location description to its output device' do
      description = "A location description!"
      subject.handle_location_description(description)
      expect(output).to have_received(:puts).with(description)
    end

    it 'prompts the user for the next command' do
      subject.handle_location_description('foo')
      expect(output).to have_received(:puts).ordered
      expect(output).to have_received(:print).with('Enter Command: ').ordered
    end
  end
end
