class Origin
  attr_accessor :stats, :degrees

  def to_s
    self.class.to_s.titleize
  end

  def strength
    roll('30d6')
  end

  def intelligence
    roll('30d6')
  end

  def agility
    roll('30d6')
  end

  def willpower
    roll('30d6')
  end

  def charisma
    roll('30d6')
  end

  def health
    roll('30d6')
  end

  def roll_stats
    {
      Strength: strength,
      IQ: intelligence,
      Agility: agility,
      Willpower: willpower,
      Charisma: charisma,
      Health: health
    }
  end

  def power_strength
    roll('30d6')
  end

  def base_powers
    1
  end

  def add_powers
    0
  end

  def weakness_chance
    0
  end

  def set_powers
    powers = []
    number_of_powers = Random.new.rand(base_powers)+add_powers
    power_count = 0
    while power_count < number_of_powers do
      power = random_power
      if powers.include? power
        next #No duplicate powers
      else
        powers << power
        power_count += 1
      end
    end
    return powers
  end

  def random_power
    name, limitation, description = PowerList.random_select
    return Power.new({name: name,
                     strength: "#{power_strength}",
                     limitation: limitation,
                     description: description
                     })
  end

  def possible_immunity
    "Immunity to " if Random.new.rand(10) === 0
  end

  def set_weaknesses
    weaknesses = []
    while weakness_chance >= Random.new.rand(100) do
      name, description = WeaknessList.random_select
      weaknesses << Weakness.new({name: name,
                       description: description
                       })
    end
    return weaknesses
  end

  def degree_calculation(intelligence)
    (intelligence-70)/20
  end

  def set_degrees(intelligence)
    return @degrees unless @degrees.blank?
    @degrees = []
    number_of_degrees = 0
    max_number = degree_calculation(intelligence)
    while max_number > number_of_degrees do
      new_degree = Faker::Educator.course
      if @degrees.include? new_degree
        next #no exact duplicate degrees
      else
        @degrees << new_degree
        number_of_degrees += 1
      end
    end
    @degrees = ["No advanced degrees of note"] if @degrees.empty?
    return @degrees
  end

  def set_name
    titles = ['sir', 'doctor', 'mister', 'mrs', 'miss', 'dr', 'captain', 'sergeant', 'commander', 'master', 'lord', 'major', 'dame', 'grim', 'general', 'gate', 'white', 'black', 'green', 'red', 'spirit']
    names = ['inferno', 'storm', 'doom', 'power', 'universe', 'sinister', 'artic', 'demon', 'america', 'forest', 'reaper', 'forever', 'avalanche', 'fate', 'mayhem', 'slaughter', 'keeper', 'skull', 'daemon']
    return "#{titles.shuffle.first} #{names.shuffle.first}"
  end
end
