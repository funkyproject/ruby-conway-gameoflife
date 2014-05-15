class ConsoleDisplay

  def initialize(line, row)
    @line = line
    @row = row
    @tabs = {}
  end

  def display(cell_list)
    cell_list.each do |cell|
      index = "#{cell.location.x.to_s}-#{cell.location.y.to_s}"
      @tabs[index] = '*' if cell.is_alive?
      @tabs[index] = ' ' unless cell.is_alive?

    end

    begin
      0.upto(@line) do |line|


        0.upto(@row) do |row|

          cell = @tabs["#{line}-#{row}"]
          print "#{cell}"
        end
        print "\n"
      end
    end

  end
end