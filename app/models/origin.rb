class Origin
  attr_accessor :stats

  def to_s
    self.class.to_s.titleize
  end

  def strength
    roll('30d6')
  end

  def intelligence
    roll('30d6')
  end

  def agility
    roll('30d6')
  end

  def willpower
    roll('30d6')
  end

  def charisma
    roll('30d6')
  end

  def endurance
    roll('30d6')
  end

  def roll_stats
    {
      Strength: strength,
      IQ: intelligence,
      Agility: agility,
      Willpower: willpower,
      Charisma: charisma,
      Endurance: endurance
    }
  end

  def power_strength
    roll('30d6')
  end

  def base_powers
    1
  end

  def add_powers
    0
  end

  def weakness_chance
    0
  end

  def set_powers
    powers = []
    (Random.new.rand(base_powers)+add_powers).times do
      powers << random_power
    end
    return powers
  end

  def random_power
    return "#{possible_immunity}#{Faker::Superhero.power}: #{power_strength}"
  end

  def possible_immunity
    "Immunity to " if Random.new.rand(10) === 0
  end

  def set_weaknesses
    weaknesses = []
    while weakness_chance >= Random.new.rand(100) do
      weaknesses << Faker::Superhero.power
    end
    return weaknesses
  end
end
