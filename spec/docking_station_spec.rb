require 'docking_station'

describe DockingStation do
  context 'Releasing bikes' do
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

    it 'raises an error if no unbroken bikes are available' do
      5.times {subject.dock(Bike.new, false) }
      expect { subject.release_bike}.to raise_error 'No bike available'
    end
    it 'finds an unbroken bike when all but one are broken' do
      5.times {subject.dock(Bike.new, false) }
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_working
    end
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
  it 'raises an error when trying to dock more bikes than max default capacity' do
    DockingStation::DEFAULT_CAPACITY.times{subject.dock(Bike.new)}
    expect { subject.dock(Bike.new) }.to raise_error "Dock is full"
  end
  it 'raises an error when trying to dock more bikes than the configured capacity' do
    capacity = 15
    docking_station = DockingStation.new(capacity)
    capacity.times {docking_station.dock(Bike.new)}
    expect(docking_station.capacity).to eq capacity
    expect { docking_station.dock(Bike.new)}.to raise_error "Dock is full"
  end

  it 'updates bike when reported as broken' do
    expect(subject.dock(Bike.new, false)).not_to be_working
  end

  it 'raises an error when we try to release a bike from an empty docking station' do
    expect { subject.release_bike }.to raise_error "No bike available"
  end
  it 'returns a capacity other the default value when a capacity is given on initialisation' do
    expect(DockingStation.new(15).capacity).to eq 15
  end
  it 'returns a default capacity when a value for capacity is not given on instantiation' do
    expect(DockingStation.new().capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
