class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(step)
    raise ArgumentError unless sliceable?(step)

    series.chars.each_cons(step).map(&:join)
  end

  private

  def sliceable?(step)
    series.length >= step
  end
end
