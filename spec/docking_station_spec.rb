require 'docking_station'

describe DockingStation do
  it 'expects DockingStation to respond to method release_bike' do
      expect(subject).to respond_to :release_bike
  end

  it 'expects a released bike to be a bike' do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_instance_of Bike
  end

  it 'expects released bike to be a working bike' do
    subject.dock(Bike.new)
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
    expect(subject.bikes).to be_instance_of Array
  end
  it 'raises an error when trying to dock more bikes than max capacity' do
    20.times{subject.dock(Bike.new)}
    expect { subject.dock(Bike.new) }.to raise_error "Dock is full"
  end
  it 'raises an error when we try to release a bike from an empty docking station' do
    expect { subject.release_bike }.to raise_error "No bike available"
  end
end
