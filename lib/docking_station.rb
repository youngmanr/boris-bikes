require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = Array.new
  end

  def release_bike
    raise "No bike available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Dock is full" if @bikes.count >= 20
    @bikes.push(bike)
    return bike
  end
end

