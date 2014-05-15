require 'rspec'

require '../dead_cell'
require '../living_cell'

describe 'Dead cell' do

  before :each do
    @cell = DeadCell.new(double('Location'))
  end

  it 'stay die when cell have fewer than three neighbours' do
    @cell.reborn?(2).should be_false
  end

  it 'should reborn when cell have exactly three neighbours' do
    @cell.reborn?(3).should be_true
  end

  it 'stay die when cell have more than three neighbours' do
    @cell.reborn?(4).should be_false
  end

  it "tick with empty universe doesn't change cell" do

    universe = double('Universe')
    allow(universe).to receive(:living_neighbours) { 0 }
    cell = @cell.tick(universe)

    cell.should eql(@cell)
  end

  it 'tick with  an universe with enough living neighbours change cell to living cell' do

    universe = double('Universe')
    allow(universe).to receive(:living_neighbours) { 3 }

    cell = @cell.tick(universe)
    cell.class.should eql(LivingCell)
  end

end