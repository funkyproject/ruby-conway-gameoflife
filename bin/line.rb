require_relative 'init'

universe = Universe.empty

universe.addCell(DeadCell.new(Location.new(0,0)))
universe.addCell(DeadCell.new(Location.new(0,1)))
universe.addCell(DeadCell.new(Location.new(0,2)))
universe.addCell(LivingCell.new(Location.new(1,0)))
universe.addCell(LivingCell.new(Location.new(1,1)))
universe.addCell(LivingCell.new(Location.new(1,2)))
universe.addCell(DeadCell.new(Location.new(2,0)))
universe.addCell(DeadCell.new(Location.new(2,1)))
universe.addCell(DeadCell.new(Location.new(2,2)))

displayer = ConsoleDisplay.new(2,2)

universe.display displayer

loop do
  (0..2).each do
    print "\r" + ("\e[A\e[K"*100)
  end
  universe.display displayer
  universe = universe.tick
  $stdout.flush
  sleep 1
end

