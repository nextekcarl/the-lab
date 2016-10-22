class Robot < Origin
  def strength
    roll('60d4')
  end

  def intelligence
    roll('30d6')
  end

  def agility
    roll('20d10')
  end

  def willpower
    roll('10d10')
  end

  def charisma
    roll('10d8')
  end

  def health
    roll('50d6')
  end

  def power_strength
    roll('20d6')+50
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
