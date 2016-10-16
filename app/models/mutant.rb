class Mutant < Origin
  def strength
    roll('2d10')
  end

  def intelligence
    roll('3d6')
  end

  def agility
    roll('2d10')
  end

  def willpower
    roll('3d6')
  end

  def charisma
    roll('2d8')
  end

  def endurance
    roll('3d6')
  end

  def power_strength
    roll('4d6')
  end

  def base_powers
    3
  end

  def add_powers
    1
  end

  def weakness_chance
    10
  end

end
