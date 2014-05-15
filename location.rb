class Location

  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def distance(another)
    [(another.x - self.x).abs, (another.y - self.y).abs].max()
  end

  def neighbourhood
    [
      Location.new(x-1,y-1),
      Location.new(x-1,y),
      Location.new(x-1,y+1),
      Location.new(x,y-1),
      Location.new(x,y+1),
      Location.new(x+1,y-1),
      Location.new(x+1,y),
      Location.new(x+1,y+1),
    ]
  end

  def is_neighbours?(another)
    distance(another) == 1
  end
end