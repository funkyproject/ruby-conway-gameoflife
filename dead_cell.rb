
require File.dirname(__FILE__)+'/has_location'

class DeadCell

  extend HasLocation

  def initialize(location)
    @location = location
  end

  def reborn?(living_neighbours)
    true if living_neighbours == 3
  end

  def tick(universe)
    return LivingCell.new(@location) if(reborn?universe.living_neighbours(self))
    self
  end

  def location
    @location
  end

  def is_alive?
    false
  end
end