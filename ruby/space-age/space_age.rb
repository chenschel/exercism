class SpaceAge
  EARTH = 365.25
  ORBITAL_PERIODS = { earth: 1,
                      mercury: 0.2408467,
                      venus: 0.61519726,
                      mars: 1.8808158,
                      jupiter: 11.862615,
                      saturn: 29.447498,
                      uranus: 84.016846,
                      neptune: 164.79132 }.freeze

  private

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(method_name, *args, &block)
    key = extract_key(method_name)
    return super unless key_include?(key)

    calc(key)
  end

  def respond_to_missing?(method_name, include_private = false)
    key = extract_key(method_name)
    key_include?(key) || super
  end

  def calc(period)
    @seconds / EARTH / ORBITAL_PERIODS[period] / 24 / 60 / 60
  end

  def key_include?(key)
    ORBITAL_PERIODS.keys.include?(key)
  end

  def extract_key(method_name)
    key = method_name.to_s.match(/\A^on_(.+)\z/)
    key[1].to_sym unless key.nil?
  end

end
