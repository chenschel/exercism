class Bob
  def self.hey(remark)
    remark = Remark.new(remark)
    return  fine if remark.blank?
    return calm_down if remark.yell_question?
    return whoa if remark.yell?
    return 'Sure.' if remark.is_question?
    'Whatever.'
  end

  def self.fine
    'Fine. Be that way!'
  end

  def self.calm_down
    "Calm down, I know what I'm doing!"
  end

  def self.whoa
    'Whoa, chill out!'
  end
end

class Remark
  def initialize(remark)
    @remark = remark.strip
  end

  def yell?
    is_upper? && not_only_numbers? && !is_question?
  end

  def yell_question?
    is_question? && is_upper? && not_only_numbers? && !only_special_chars?
  end

  def only_special_chars?
    !!head.match(/^[:) ]+$/)
  end

  def not_only_numbers?
    num = head.split(', ').join if is_question?
    num = @remark.split(', ').join unless is_question?
    false unless Float(num) rescue true
  end

  def tail
    @remark[-1]
  end

  def head
    @remark[0...-1]
  end

  def is_question?
    tail == '?'
  end

  def is_upper?
    @remark == @remark.upcase
  end

  def blank?
    @remark.empty?
  end
end
