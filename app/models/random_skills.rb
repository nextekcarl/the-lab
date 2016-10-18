class RandomSkills
  attr_accessor :name
  def initialize
    @name = [
      'Martial Arts',
      'Driving',
      'Piloting',
      'Acting',
      'Invention',
      'Mechanics',
      'First Aid',
      'Hacking',
      'Stealth',
      'Archery',
      'Animal Handling',
      'Survival',
      'CSI'
    ].sample
  end

  def to_s
    @name
  end

  def ==(o)
    o.class == self.class && o.name == self.name
  end
end
