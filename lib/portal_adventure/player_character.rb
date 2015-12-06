module PortalAdventure
  class PlayerCharacter
    def initialize(location:)
      self.current_location = location
    end

    def inspect_location(tell:)
      tell.handle_location_description current_location.description
    end

    private

    attr_accessor :current_location
  end
end
