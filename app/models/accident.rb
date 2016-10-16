class Accident < Origin

  def to_s
    "Accident, #{origin_details}"
  end

  def origin_details
    ['military', 'irreproducible', 'magicial in origin'].shuffle.first
  end

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
    roll('2d6')+6
  end

  def charisma
    roll('3d6')
  end

  def endurance
    roll('2d6')+6
  end

  def power_strength
    roll('2d10')
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
