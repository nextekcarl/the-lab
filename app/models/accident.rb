class Accident < Origin

  def to_s
    "Accident, #{origin_details}"
  end

  def origin_details
    ['military', 'irreproducible', 'magic in origin'].shuffle.first
  end

  def strength
    roll('20d10')
  end

  def intelligence
    roll('30d6')
  end

  def agility
    roll('20d10')
  end

  def willpower
    roll('20d6')+60
  end

  def charisma
    roll('30d6')
  end

  def endurance
    roll('20d6')+60
  end

  def power_strength
    roll('20d10')
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
