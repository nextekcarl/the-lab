class Weakness
  attr_accessor :name, :description

  def initialize(args)
    args = HashWithIndifferentAccess.new(args)
    @name = args[:name]
    @description = args[:description]
  end

  def to_s
    return "#{self.name}"
  end

  def to_db
    self.to_json
  end

  def ==(o)
    o.class == self.class && o.name == self.name
  end

  def self.from_db(json)
    Weakness.new(json)
  end
end
