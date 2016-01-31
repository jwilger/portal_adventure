module PortalAdventure
  class PlayerCharacter
    def initialize(starting_location:)
      self.current_location = starting_location
    end

    def look(output_target:)
      current_location.describe(to: output_target)
    end

    private

    attr_accessor :current_location
  end
end
