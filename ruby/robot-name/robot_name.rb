class Robot
  NAMES = ('AA000'..'ZZ999')

  def self.forget
    @@names = nil
  end

  private 

  def initialize
    reset
  end

  def next_name
    @@names ||= NAMES.to_enum
    @@names.next
  end

  public

  def name
    @name ||= next_name
  end

  def reset
    @name = nil
  end
end
