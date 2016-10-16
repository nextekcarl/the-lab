class Curse < Origin
  def strength
    roll('30d6')
  end

  def intelligence
    roll('30d6')
  end

  def agility
    roll('10d20')
  end

  def willpower
    roll('40d6')
  end

  def charisma
    roll('20d10')
  end

  def endurance
    roll('20d6')+60
  end

  def power_strength
    roll('40d6', true)
  end

  def base_powers
    3
  end

  def add_powers
    1
  end

  def weakness_chance
    20
  end

end
