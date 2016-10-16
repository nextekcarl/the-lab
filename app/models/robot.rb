class Robot < Origin
  def strength
    roll('6d4')
  end

  def intelligence
    roll('3d6')
  end

  def agility
    roll('2d10')
  end

  def willpower
    roll('1d10')
  end

  def charisma
    roll('1d8')
  end

  def endurance
    roll('5d6')
  end

  def power_strength
    roll('2d6')+5
  end

  def base_powers
    3
  end

  def add_powers
    1
  end

  def weakness_chance
    5
  end

end
