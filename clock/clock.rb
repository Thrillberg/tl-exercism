class Clock
  def self.at(hour, min=0)
    new(hour, min)
  end

  def initialize(hour, min)
    @time = Time.utc(1970, 1, 1, hour, min)
  end

  def to_s
    @time.strftime("%H:%M")
  end

  def +(minutes)
    @time = @time + (minutes * 60)
    self.class.new(@time.hour, @time.min)
  end

  def -(minutes)
    @time = @time - (minutes * 60)
    self.class.new(@time.hour, @time.min)
  end

  def ==(other)
    @time.strftime("%H:%M") == other.to_s
  end
end

#clock = Clock.new(8, 15)
#clock.to_s