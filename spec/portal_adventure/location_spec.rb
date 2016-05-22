require 'portal_adventure/location'

RSpec.describe PortalAdventure::Location do
  let(:location_description) {
    'The room is completely devoid of any discernable features.'
  }

  subject {
    described_class.new(description: location_description)
  }

  it 'provides its description to the output target' do
    output_target = instance_double('PortalAdventure::PlayerCommands::Look',
                                    handle_location_description: nil)
    subject.describe(to: output_target)
    expect(output_target).to have_received(:handle_location_description)
      .with(location_description)
  end
end
