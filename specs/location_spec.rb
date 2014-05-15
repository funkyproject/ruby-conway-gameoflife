require 'rspec'
require '../location'

describe 'Location distance ' do
  it 'should eql 1 when top left neighbours' do
    location = Location.new(1, 1)
    neighbours = Location.new(0, 0)

    location.distance(neighbours).should eql(1)
  end

  it 'should eql 0 when is same' do
    location = Location.new(1, 1)
    neighbours = Location.new(1, 1)

    location.distance(neighbours).should eql(0)
  end

  it 'should eql 2 when is not neighbours' do
    location = Location.new(2, 2)
    neighbours = Location.new(0, 1)

    location.distance(neighbours).should eql(2)
  end
end

describe 'Location neighbourhood' do
  it 'should return 8 neighbours' do
      location = Location.new(1,1)
      location.neighbourhood.count.should eql(8)
  end


  it 'should always have 1 of distance' do
    location = Location.new(1,1)

    location.neighbourhood.each do |neighbours|
      location.distance(neighbours).should eql(1)
    end
  end
end
