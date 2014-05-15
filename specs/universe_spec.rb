require 'rspec'
require '../universe'
require '../living_cell'
require '../location'

describe 'Empty univers' do

  before :each do
    @universe = Universe.empty
  end

  it 'should empty after tick' do
    new_universe = @universe.tick
    new_universe.empty?.should be_true
  end

  it 'should not empty after add  cell and tick' do
    cell = double("Cell")
    allow(cell).to receive(:tick)
    @universe.addCell(cell)
    new_universe = @universe.tick
    new_universe.empty?.should be_false
  end


  it 'should not dead after add line of three living cell and tick' do
    dead_cell = double("Cell")
    allow(dead_cell).to receive(:is_alive?) { false }

    living_cell = double("Cell")
    allow(living_cell).to receive(:is_alive?) { true }
    allow(living_cell).to receive(:tick).with(any_args()) { dead_cell }

    @universe.addCell(living_cell)

    new_universe = @universe.tick
    new_universe.dead?.should be_true
  end


  it 'should not dead after add line of three living cell and tick' do

    living_cell = double("Cell")

    allow(living_cell).to receive(:tick) { living_cell }
    allow(living_cell).to receive(:is_alive?) { true }

    @universe.addCell(living_cell)
    @universe.addCell(living_cell)
    @universe.addCell(living_cell)
    new_universe = @universe.tick
    new_universe.dead?.should be_false
  end

  it 'add only one cell and return 0 living neighbours' do

    cell = LivingCell.new(Location.new(1, 1))

    @universe.addCell(cell)
    @universe.living_neighbours(cell).should eql(0)
  end

  it 'add with two neighbours living cell and return 1 living neighbours' do

    cell = LivingCell.new(Location.new(1, 1))
    neighbours = LivingCell.new(Location.new(1, 2))

    @universe.addCell(cell)
    @universe.addCell(neighbours)
    @universe.living_neighbours(cell).should eql(1)
  end
end