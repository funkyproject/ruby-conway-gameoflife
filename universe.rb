class Universe

  def initialize
    @cells = []
  end

  def self.empty
    return new
  end

  def addCell(cell)
    @cells << cell
  end

  def tick
    universe = self.class.empty

    @cells.each do |cell|
      universe.addCell(cell.tick(self))
    end

    universe
  end

  def empty?
    @cells.empty?
  end

  def dead?
    @cells.select { |cell| cell.is_alive? }.empty?
  end

  def living_neighbours(cell)
    @cells.select do |potential_neighbours|
        potential_neighbours.is_alive? and cell.location.is_neighbours?potential_neighbours.location
    end .count
  end

  def display(displayer)
    displayer.display(@cells)
  end
end