require 'portal_adventure/player_character'
require 'portal_adventure/location'

module PortalAdventure
  class Universe
    attr_reader :active_character

    def initialize(starting_character: player_character_factory.())
      self.active_character = starting_character
    end

    def look(output_target:)
      active_character.look(output_target: output_target)
    end

    private

    attr_writer :active_character

    def player_character_factory
      -> {
        PlayerCharacter.new(starting_location: starting_location)
      }
    end

    def starting_location
      Location.new(description: "The room is vast and devoid of any discernable features.")
    end
  end
end
