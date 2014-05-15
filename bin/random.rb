require_relative 'init'

universe = Universe.empty

(0..20).each do |line|
  (0..40).each do |row|
    if rand(100) % 3 == 0
      universe.addCell(LivingCell.new(Location.new(line, row)))
    else
      universe.addCell(DeadCell.new(Location.new(line, row)))
    end
  end
end


displayer = ConsoleDisplay.new(20,40)

loop do
  (0..20).each do
    print "\r" + ("\e[A\e[K"*100)
  end
  universe.display displayer
  universe = universe.tick
  $stdout.flush
  #sleep 1
end




