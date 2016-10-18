class Power
  attr_accessor :name, :strength

  def initialize(args)
    @name = args[:name]
    @strength = args[:strength]
  end

  def to_s
    "#{self.name}: #{self.strength}"
  end

  def ==(o)
    o.class == self.class && o.name == self.name
  end
end
