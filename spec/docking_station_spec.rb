require 'docking_station'

describe DockingStation do
  it 'expects DockingStation to respond to method release_bike' do
      expect(subject).to respond_to :release_bike
  end

  it 'expects released bike to be a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'expects DockingStation to respond to method dock with one argument' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'docked a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns bike when asked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end