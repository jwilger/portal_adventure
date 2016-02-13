module PortalAdventure
  class PlayerInterface
    def initialize(universe, output: STDOUT)
      self.output = output
      universe.look(output_target: self)
    end

    def handle_location_description(description)
      output.puts description
      output.print 'Enter Command: '
    end

    private

    attr_accessor :output
  end
end
