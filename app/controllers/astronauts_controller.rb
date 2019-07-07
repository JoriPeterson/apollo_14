class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    # @astronauts.average_age
  end

end
