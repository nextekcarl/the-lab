class Mutant < Origin
  attr_accessor :omega
  def initialize
    @omega = roll('1d4') === 4
  end

  def to_s
    return "Mutant, Omega level" if @omega
    "Mutant"
  end

  def strength
    roll('20d10', @omega)
  end

  def intelligence
    roll('30d6', @omega)
  end

  def agility
    roll('20d10', @omega)
  end

  def willpower
    roll('30d6', @omega)
  end

  def charisma
    roll('20d8', @omega)
  end

  def health
    roll('30d6', @omega)
  end

  def power_strength
    return roll('56d4', true) if @omega
    roll('40d6', true)
  end

  def base_powers
    3
  end

  def add_powers
    1
  end

  def set_powers
    powers = super
    if @omega
      name, limitation, description = PowerList.random_select('godlike')
      extra_power = Power.new({name: name,
                       strength: "#{power_strength}",
                       limitation: limitation,
                       description: description
                       })
      powers << extra_power
    end
    return powers
  end

  def random_power
    name, limitation, description = PowerList.random_select
    return Power.new({name: name,
                     strength: "#{power_strength}",
                     limitation: limitation,
                     description: description
                     })
  end

  def weakness_chance
    return 5 if @omega
    10
  end

end
