require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = Array.new
  end

  def release_bike
    raise "No bike available" if empty? || @bikes.all? {|bike| !bike.working?}
    @bikes.pop
  end

  def dock(bike, working = true)
    raise "Dock is full" if full?
    bike.working = working
    @bikes.push(bike)
    return bike
  end

  private

  def full?
     @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

