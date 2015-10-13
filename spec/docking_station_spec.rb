require 'docking_station'

describe DockingStation do
  it 'expects DockingStation to respond to method release_bike' do
      expect(subject).to respond_to :release_bike
  end

  it 'expects released bike to be a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end