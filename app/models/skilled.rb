class Skilled < Origin
  def strength
    roll('30d6')
  end

  def intelligence
    roll('10d6', true)+90
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

  def base_skills
    3
  end

  def add_skills
    2
  end

  def weakness_chance
    0
  end

  def degree_calculation(intelligence)
    (intelligence-40)/20
  end

  def set_powers
    skills = []
    number_of_skills = Random.new.rand(base_skills)+add_skills
    skill_count = 0
    while skill_count < number_of_skills do
      skill = RandomSkills.new
      if skills.include? skill
        next #No duplicate skills
      else
        skills << skill
        skill_count += 1
      end
    end
    return skills
  end

end
