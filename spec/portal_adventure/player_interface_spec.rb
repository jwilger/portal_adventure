require 'portal_adventure/player_interface'

RSpec.describe PortalAdventure::PlayerInterface do
  let(:universe) {
    instance_double('PortalAdventure::Universe', look: nil)
  }

  let(:output) { instance_double('IO', puts: nil, print: nil) }
  let(:input) { instance_double('IO', gets: '') }

  let!(:look_command) {
    class_double('PortalAdventure::Commands::Look', call: nil)
      .as_stubbed_const
  }

  let!(:quit_command) {
    class_double('PortalAdventure::Commands::Quit', call: nil)
      .as_stubbed_const
  }

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

  it 'can execute the Look command based on user input' do
    subject.run_command('look foo bar baz')
    expect(look_command).to have_received(:call)
      .with(command_args: 'foo bar baz')
  end

  it 'can execute the Quit command based on user input' do
    subject.run_command('quit')
    expect(quit_command).to have_received(:call)
  end

  it 'executes the Look command on startup' do
    described_class.new(universe, output: output, input: input)
    expect(look_command).to have_received(:call).with(no_args)
  end
end
