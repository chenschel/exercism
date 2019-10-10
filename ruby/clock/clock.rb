require 'date'
require 'active_support/time'

class Clock
  def initialize(hour: 0, minute: 0)
    @time = DateTime.new
    @time += hour.hours
    @time += minute.minutes
  end

  def to_s
    @time.strftime('%H:%M')
  end

  def +(other_time)
    @time += other_time.hours
    @time += other_time.minutes
    self
  end

  def -(other_time)
    @time -= other_time.hours
    @time -= other_time.minutes
    self
  end

  def ==(other_time)
    hours == other_time.hours && minutes == other_time.minutes 
  end

  protected

  def hours
    @time.hour.hour
  end

  def minutes
    @time.minute.minute
  end
end
