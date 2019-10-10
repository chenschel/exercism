class Year
  def self.leap?(year)
    @year = year
    is_leap?
  end

  def self.is_leap?
    div_by_4?
    .yield_self { |ck| div_by_4_and_100? ? false : ck }
    .yield_self { |ck| (ck == false && div_by_4_and_400?) ? true : ck }
  end

  def self.div_by_4_and_400?
    div_by_4? && div_by_400?
  end

  def self.div_by_4_and_100?
    div_by_4? && div_by_100?
  end

  def self.div_by_4?
    @year % 4 == 0
  end

  def self.div_by_100?
    @year % 100 == 0
  end

  def self.div_by_400?
    @year % 400 == 0
  end
end