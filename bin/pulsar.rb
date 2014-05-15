require_relative 'init'

universe = Universe.empty

empty_line = -> (universe,line) {
  (0..16).each { |row|  universe.addCell(DeadCell.new(Location.new(line,row)))}
}

first_line_bar = -> (universe,line) {
 (0..3).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
 (4..6).each { |row| universe.addCell(LivingCell.new(Location.new(line,row))) }
 (7..9).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
 (10..12).each { |row| universe.addCell(LivingCell.new(Location.new(line,row))) }
 (13..16).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
}

second_line_bar = -> (universe,line) {
  (0..1).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
  universe.addCell(LivingCell.new(Location.new(line,2)))
  (3..6).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
  universe.addCell(LivingCell.new(Location.new(line,7)))
  universe.addCell(DeadCell.new(Location.new(line,8)))
  universe.addCell(LivingCell.new(Location.new(line,9)))
  (10..13).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
  universe.addCell(LivingCell.new(Location.new(line,14)))
  (15..16).each { |row| universe.addCell(DeadCell.new(Location.new(line,row))) }
}


empty_line.call(universe,0)
empty_line.call(universe,1)
first_line_bar.call(universe,2)
empty_line.call(universe,3)
second_line_bar.call(universe,4)
second_line_bar.call(universe,5)
second_line_bar.call(universe,6)
first_line_bar.call(universe,7)
empty_line.call(universe,8)
first_line_bar.call(universe,9)
second_line_bar.call(universe,10)
second_line_bar.call(universe,11)
second_line_bar.call(universe,12)
empty_line.call(universe,13)
first_line_bar.call(universe,14)
empty_line.call(universe,15)
empty_line.call(universe,16)


displayer = ConsoleDisplay.new(16,16)

loop do
  (0..16).each do
    print "\r" + ("\e[A\e[K"*100)
  end
  universe.display displayer
  universe = universe.tick
  $stdout.flush
  sleep 1
end




