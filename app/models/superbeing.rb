class Superbeing < ApplicationRecord
  attr_accessor :powers, :stats, :real_origin, :degrees, :weaknesses

  after_initialize do
    self.origin = set_origin if origin.blank?
    set_powers
    set_stats
    set_degrees
    set_weaknesses
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

  def set_weaknesses
    @weaknesses ||= self.real_origin.set_weaknesses
  end

  def set_degrees
    return @degrees unless @degrees.blank?
    @degrees = []
    (@stats[:intelligence]/7).times do
      @degrees << Faker::Educator.course
    end
    @degrees = ["No advanced degrees of note"] if @degrees.empty?
  end
end
