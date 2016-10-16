class Alien < Origin
  def strength
    roll('1d24')
  end

  def intelligence
    roll('1d24')
  end

  def agility
    roll('1d24')
  end

  def willpower
    roll('1d24')
  end

  def charisma
    roll('1d24')
  end

  def endurance
    roll('1d24')
  end

  def power_strength
    roll('2d10')
  end

  def base_powers
    5
  end

  def add_powers
    2
  end

  def weakness_chance
    30
  end

end
