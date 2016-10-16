class Alien < Origin

  def to_s
    "Alien from #{home}"
  end

  def home
    [Faker::Space.star, Faker::Space.star_cluster, Faker::Space.constellation, Faker::Space.galaxy, Faker::Space.nebula].shuffle.first
  end

  def strength
    roll('10d24')
  end

  def intelligence
    roll('10d24', true)
  end

  def agility
    roll('10d24')
  end

  def willpower
    roll('10d24')
  end

  def charisma
    roll('10d24')
  end

  def endurance
    roll('10d24')
  end

  def power_strength
    roll('20d10', true)
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
