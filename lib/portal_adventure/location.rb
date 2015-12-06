module PortalAdventure
  class Location
    attr_reader :description

    def initialize
      self.description = "You are in a room with a description."
    end

    private
    
    attr_writer :description
  end
end
