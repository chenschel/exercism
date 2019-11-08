class Series
  class SeriesArgumentError < ArgumentError; end
  class SeriesNegativeScaleError < ArgumentError; end
  class SeriesInvalidInputError < ArgumentError; end

  attr_reader :digest
  def initialize(digest_string)
    raise SeriesInvalidInputError if digest_string.match(/[[:alpha:]]/)

    @digest = digest_string.scan(/\d/).map(&:to_i)
  end

  def largest_product(scale)
    raise_error_on_invalid_scale?(scale)

    @digest.to_enum.each_cons(scale).to_a.map { |numbers| numbers.inject(&:*) }.max
  rescue ArgumentError => e
    raise e if e.is_a?(SeriesArgumentError) || e.is_a?(SeriesNegativeScaleError)

    1
  end

  def raise_error_on_invalid_scale?(scale)
    raise SeriesArgumentError if @digest.length < scale
    raise SeriesNegativeScaleError if scale.negative?
  end
end

