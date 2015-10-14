require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = Array.new
  end

  def release_bike
    raise "No bike available" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Dock is full" if full?
    @bikes.push(bike)
    return bike
  end

  private

  def full?
     @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end

