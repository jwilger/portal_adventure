module PortalAdventure
  class PlayerInterface
    def initialize(input:, output:)
      self.input = input
      self.output = output
    end

    def handle_location_description(description)
      output.puts description
    end

    def process_next_command
    end

    private

    attr_accessor :input, :output
  end
end
