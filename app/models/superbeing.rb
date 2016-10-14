class Superbeing < ApplicationRecord
  attr_accessor :powers, :stats

  after_initialize do
    self.origin = set_origin if origin.blank?
    set_powers
    set_stats
    self.name = Faker::Superhero.name
  end

  private

  def set_origin
    ['Mutant', 'Curse', 'Accident', 'Experiment', 'Robotics'].shuffle.first
  end

  def set_powers
    @powers = []
    case self.origin
    when 'Mutant'
      (Random.new.rand(5)+1).times do
        @powers << random_power
      end
    when 'Curse'
      (Random.new.rand(3)+1).times do
        @powers << random_power
      end
    when 'Accident'
      (Random.new.rand(3)+2).times do
        @powers << random_power
      end
    when 'Experiment'
      (Random.new.rand(3)+1).times do
        @powers << random_power
      end
    when 'Robotics'
      (Random.new.rand(2)+3).times do
        @powers << random_power
      end
    end
  end

  def random_power
    strength = ''
    case self.origin
    when 'Mutant'
      strength = ['Feeble', 'Minor', 'Average', 'Major', 'Cosmic', 'Godlike'].shuffle.first
    when 'Curse'
      strength = ['Minor', 'Average', 'Major', 'Cosmic'].shuffle.first
    when 'Accident'
      strength = ['Feeble', 'Minor', 'Average', 'Major', 'Godlike'].shuffle.first
    when 'Experiment'
      strength = ['Minor', 'Average', 'Average', 'Major', 'Major', 'Major', 'Cosmic', 'Godlike'].shuffle.first
    when 'Robotics'
      strength = ['Minor', 'Average', 'Major', 'Major'].shuffle.first
    end
    return "#{strength} #{Faker::Superhero.power}"
  end

  def set_stats
    @stats = []
    ['Strength', 'Intelligence', 'Agility', 'Charisma'].each do |stat|
      case self.origin
      when 'Mutant'
        @stats << "#{['Feeble', 'Minor', 'Average', 'Major', 'Cosmic', 'Godlike'].shuffle.first} #{stat}"
      when 'Curse'
        @stats << "#{['Minor', 'Average', 'Major'].shuffle.first} #{stat}"
      when 'Accident'
        @stats << "#{['Feeble', 'Minor', 'Average', 'Major'].shuffle.first} #{stat}"
      when 'Experiment'
        @stats << "#{['Average', 'Average', 'Major', 'Major', 'Major', 'Cosmic'].shuffle.first} #{stat}"
      when 'Robotics'
        @stats << "#{['Average', 'Major', 'Major'].shuffle.first} #{stat}"
      end
    end
  end
end
