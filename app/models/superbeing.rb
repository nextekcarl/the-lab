class Superbeing < ApplicationRecord
  attr_accessor :powers, :stats, :real_origin, :degrees, :weaknesses

  def victories
    Arena.where("victor_id = ?", self.id)
  end

  def losses
    Arena.where("victor_id != ? AND victor_id IS NOT NULL", self.id)
  end

  after_initialize do
    if self.name.blank?
      self.origin = set_origin if origin.blank?
      set_powers
      set_stats
      set_degrees
      set_weaknesses
      self.name = set_name
    else
      #parse description to get stats, degrees, and weaknesses
      parse_description
    end
  end

  before_create do
    self.description = ''
    @stats.each do |stat, val|
      self.description += "STAT: #{stat.to_s}: #{val}\n"
    end
    @powers.each do |power|
      self.description += "POWER: #{power.to_db}\n"
    end
    self.weaknesses.each do |weakness|
      self.description += "WEAKNESS: #{weakness.to_db}\n"
    end
    self.degrees.each do |degree|
      self.description += "DEGREE: #{degree}\n"
    end
  end

  private

  def set_origin
    #TODO: Rework Skilled to use new power system
    @real_origin = [Mutant.new, Curse.new, Accident.new, Experiment.new, Robot.new, Magic.new, Alien.new, Skilled.new].shuffle.first
  end

  def set_name
    @name ||= self.real_origin.set_name.titleize
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

  def parse_description
    @powers = []
    @stats = {}
    @weaknesses = []
    @degrees = []
    self.description.split("\n").each do |line|
      if stat = line.match(/^STAT:\s(\w+):\s(\d+)$/)
        @stats[stat[1]] = stat[2].to_i
      elsif power = line.match(/^POWER:\s(.+)$/)
        @powers << Power.from_db(JSON.parse(power[1]))
      elsif weakness = line.match(/^WEAKNESS:\s(\w+)$/)
        @weaknesses << Weakness.from_db(JSON.parse(weakness[1]))
      elsif degree = line.match(/^DEGREE:\s(.+)$/)
        @degrees << degree[1]
      end
    end
  end
end
