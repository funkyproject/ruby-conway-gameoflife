require File.dirname(__FILE__)+'/has_location'

class LivingCell

  extend HasLocation

  def initialize(location)
    @location = location
  end

  def stay_alive?(living_neighbours)
    true if living_neighbours == 2 or living_neighbours == 3
  end

  def tick(universe)
    return DeadCell.new(@location)  unless stay_alive?universe.living_neighbours(self)
    self
  end

  def location
    @location
  end

  def is_alive?
    true
  end
end