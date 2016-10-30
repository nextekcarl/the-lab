class Power
  attr_accessor :name, :strength, :limitation, :description

  def initialize(args)
    @name = args[:name]
    @strength = args[:strength]
    @limitation = args[:limitation]
    @description = args[:description]
  end

  def to_s
    if self.limitation.blank?
      return "#{self.name}: #{self.strength}"
    else
      return "#{self.name} [#{self.limitation}]: #{self.strength}"
    end
  end

  def ==(o)
    o.class == self.class && o.name == self.name
  end
end
