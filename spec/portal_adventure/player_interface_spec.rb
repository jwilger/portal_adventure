require 'portal_adventure/player_interface'

RSpec.describe PortalAdventure::PlayerInterface do
  subject {
    described_class.new(input: input_stream, output: output_stream)
  }

  let(:input_stream) { instance_double(IO, gets: nil) }
  let(:output_stream) { instance_double(IO, puts: nil, print: nil) }

  describe '#handle_location_description' do
    it 'sends the location description to the output stream' do
      subject.handle_location_description 'This is a room.'
      expect(output_stream).to have_received(:puts).with('This is a room.')
    end
  end

  describe '#process_next_command' do
    let(:active_character) {
      instance_double('PortalAdventure::PlayerCharacter', inspect_location: nil)
    }

    before(:each) do
      subject.process_next_command(character: active_character)
    end

    it 'prompts the user and reads the next command from the input' do
      expect(output_stream).to have_received(:print).with('Enter command: ').ordered
      expect(input_stream).to have_received(:gets).ordered
    end

    it 'tells the active character to inspect location' do
      expect(active_character).to have_received(:inspect_location)
    end
  end
end
