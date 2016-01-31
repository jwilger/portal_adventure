module PortalAdventure
  class Location
    def initialize(description:)
      self.description = description
    end

    def describe(to:)
      to.handle_location_description(description)
    end

    private

    attr_accessor :description
  end
end
