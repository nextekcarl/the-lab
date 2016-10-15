class Curse < Origin
  def strength
    roll('3d6')
  end

  def intelligence
    roll('3d6')
  end

  def agility
    roll('1d20')
  end

  def willpower
    roll('4d6')
  end

  def charisma
    roll('2d10')
  end

  def endurance
    roll('2d6')+6
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

end
