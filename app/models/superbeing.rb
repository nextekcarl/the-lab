class Superbeing < ApplicationRecord
  attr_accessor :powers, :stats, :real_origin

  after_initialize do
    self.origin = set_origin if origin.blank?
    set_powers
    set_stats
    self.name = Faker::Superhero.name
  end

  private

  def set_origin
    @real_origin = [Mutant.new, Curse.new, Accident.new, Experiment.new, Robot.new, Magic.new, Alien.new].shuffle.first
  end

  def set_powers
    @powers ||= self.real_origin.set_powers
  end

  def set_stats
    @stats ||= self.real_origin.roll_stats
  end
end
