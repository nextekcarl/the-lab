class Magic < Origin
  def strength
    roll('3d6')
  end

  def intelligence
    roll('2d6')+6
  end

  def agility
    roll('3d6')
  end

  def willpower
    roll('4d6')
  end

  def charisma
    roll('3d8')
  end

  def endurance
    roll('3d6')
  end

  def power_strength
    roll('5d4')
  end

  def base_powers
    2
  end

  def add_powers
    2
  end

end
