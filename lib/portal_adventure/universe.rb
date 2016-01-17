require 'portal_adventure/player_character'
require 'portal_adventure/location'

module PortalAdventure
  class Universe
    attr_reader :active_character

    def initialize(player_interface:, starting_location: default_location,
                   default_character: default_character_builder)
      self.player_interface = player_interface
      self.active_character = default_character.call(location: starting_location)
    end

    def run
      active_character.inspect_location(tell: player_interface)
      player_interface.process_next_command(character: active_character)
    end

    private

    attr_writer :active_character
    attr_accessor :player_interface

    def default_character_builder
      ->(location:) {
        PlayerCharacter.new(location: location)
      }
    end

    def default_location
      Location.new
    end
  end
end
