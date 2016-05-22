require 'portal_adventure/player_interface'

RSpec.describe PortalAdventure::PlayerInterface do
  let(:universe) {
    instance_double('PortalAdventure::Universe', look: nil)
  }

  let(:output) { instance_double('IO', puts: nil, print: nil) }
  let(:input) { instance_double('IO', gets: '') }

  subject {
    described_class.new(universe, output: output, input: input)
  }

  it 'can display the provided text on its output' do
    ['foo', 123, :bar, self].each do |text|
      subject.display_text(text)
      expect(output).to have_received(:puts).with(text)
    end
  end

  it 'can display a command promt that waits for user input' do
    subject.prompt_for_next_command
    expect(output).to have_received(:print).with('Enter Command: ').ordered
    expect(input).to have_received(:gets).ordered
  end

  it 'can execute the Look command based on user input'

  it 'can execute the Quit command based on user input'

  it 'executes the Look command on startup'
end
