class Magic < Origin
  def strength
    roll('30d6')
  end

  def intelligence
    roll('20d6')+60
  end

  def agility
    roll('30d6')
  end

  def willpower
    roll('40d6')
  end

  def charisma
    roll('30d8')
  end

  def health
    roll('30d6')
  end

  def power_strength
    roll('50d4')
  end

  def base_powers
    2
  end

  def add_powers
    2
  end

  def weakness_chance
    15
  end

end
