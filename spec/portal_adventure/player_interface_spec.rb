require 'portal_adventure/player_interface'

RSpec.describe PortalAdventure::PlayerInterface do
  subject {
    described_class.new(input: input_stream, output: output_stream)
  }

  let(:input_stream) { instance_double(IO) }
  let(:output_stream) { instance_double(IO, puts: nil) }

  describe '#handle_location_description' do
    it 'sends the location description to the output stream' do
      subject.handle_location_description 'This is a room.'
      expect(output_stream).to have_received(:puts).with('This is a room.')
    end
  end
end
