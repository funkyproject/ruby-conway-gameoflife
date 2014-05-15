require 'rspec'
require '../living_cell'
require '../dead_cell'

describe 'Living cell' do

  before :each do
    @cell = LivingCell.new(double('Location'))
  end

  it 'should die when cell have fewer than two neighbours' do
    @cell.stay_alive?(1).should be_false
  end

  it 'should stay alive when cell have  two neighbours' do
    @cell.stay_alive?(2).should be_true
  end

  it 'should stay alive when cell have  three neighbours' do
    @cell.stay_alive?(3).should be_true
  end

  it 'should die when cell have more than three neighbours' do
    @cell.stay_alive?(4).should be_false
  end

  it 'tick with empty universe change cell to dead cell' do

    universe = double('Universe')
    allow(universe).to receive(:living_neighbours) { 0 }
    cell = @cell.tick(universe)

    cell.class.should eql(DeadCell)
  end

  it 'tick with  an universe with enough living neighbours change cell to living cell' do

    universe = double('Universe')
    allow(universe).to receive(:living_neighbours) { 3 }

    cell = @cell.tick(universe)
    cell.should eql(@cell)
  end

end