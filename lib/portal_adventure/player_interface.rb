module PortalAdventure
  class PlayerInterface
    def initialize(universe, output: STDOUT, input: STDIN)
      self.output = output
      self.input = input
      look_command.call
    end

    def run_command(user_input)
      input_words = user_input.split(/\s+/, 2)
      command = input_words.shift
      case command
      when 'look'
        look_command.call({:command_args=>'foo bar baz'})
      when 'quit'
        quit_command.call
      end
    end

    def display_text(text)
      output.puts text
    end

    def prompt_for_next_command
      output.print "Enter Command: "
      input.gets
    end

    private

    attr_accessor :output, :input

    def look_command
      Commands::Look
    end

    def quit_command
      Commands::Quit
    end
  end
end
