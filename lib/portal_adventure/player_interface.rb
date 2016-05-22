module PortalAdventure
  class PlayerInterface
    def initialize(universe, output: STDOUT, input: STDIN)
      self.output = output
      self.input = input
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
  end
end
