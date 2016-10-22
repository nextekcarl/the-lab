class Superbeing < ApplicationRecord
  attr_accessor :powers, :stats, :real_origin, :degrees, :weaknesses

  after_initialize do
    if self.name.blank?
      self.origin = set_origin if origin.blank?
      set_powers
      set_stats
      set_degrees
      set_weaknesses
      self.name = Faker::Superhero.name
    end
  end

  before_create do
    self.description = @powers.map(&:to_s).join("\n")
    self.weaknesses.each do |weakness|
      self.description += "Weak vs: #{weakness}\n"
    end
    self.degrees.each do |degree|
      self.description += "#{degree}\n"
    end
  end

  private

  def set_origin
    @real_origin = [Mutant.new, Curse.new, Accident.new, Experiment.new, Robot.new, Magic.new, Alien.new, Skilled.new].shuffle.first
  end

  def set_powers
    @powers ||= self.real_origin.set_powers
  end

  def set_stats
    @stats ||= self.real_origin.roll_stats
  end

  def set_weaknesses
    @weaknesses ||= self.real_origin.set_weaknesses
  end

  def set_degrees
    @degrees ||= self.real_origin.set_degrees(@stats[:IQ])
  end
end
