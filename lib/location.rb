class Location
  #TODO: Upon initialize , use template to build some sort of random
  #location. It needs a name and a description. Something to make the fights
  #more interesting than just a boxing ring. Some dangers, description of cover,
  #weapons of opportunity, etc.

  #Ex: A burning warehouse full of high explosives. A Deserted island filled with
  #dinos and Kaiju.
  DANGERS = {
    'populated by Kaiju': 'pose a danger, but big boost if you have Mind Control',
    'on fire': 'causes damage unless immune to fire/heat',
    'filled with deadly traps': 'causes damage to those without enhanced senses, but increases damage done by those with high IQ',
    'during a Meteor shower': 'causes random physical damage',
    'that has become a Radioactive wasteland': 'reduces all stats unless immune to radiation',
    'during a zombie apocalypse': "pose a danger that's immune to mind control and harm due to endless numbers",
    'in the middle of a Dinosaur rampage': 'pose a danger, but give boost to those with Mind Control',
    'during a 9.0 Earthquake': 'reduces accuracy unless you have flight or levitation, or Terrakinesis',
    'while a Tsunami strikes': 'having water breathing reduces penalties',
    'during a Hurricane': 'weather control gives bonuses rather than penalties',
    'in a Lightning storm': 'causes random damage, but makes Atmokinesis 2x effective',
    'while being Carpet bombed': 'requires danger Sense or high armor to prevent high damage',
    'infested with Sand Worms': 'pose a danger, but provide a big boost if you have Mind Control or Terrakinesis',
  }

  PLACES = {
    'Warehouse': 'limited line of sight, lots of cover',
    'Deserted island': 'traps are 2x worse',
    'Ancient forest': 'if on fire, damage is 2x worse',
    'Active volcano': 'auto heat damage each minute unless immune to heat',
    'Alien Coliseum': 'aliens force you to fight, like flashier fights, decide winner',
    'Downtown New York': 'lots of skyscrapers to fight around, zombie apocalypse, if present, is 2x worse',
    'Tokyo': 'Kaiju are stronger here (2x worse)',
    'Moon Base Alpha': 'atmokinesis is weaker, meteor shower is 2x worse',
    'International space station': 'collateral damage is bad, unless immune to vaccuum',
    'Dubai tower': 'wealth is distracting, private security will protect it',
    'Jurassic park': 'dinos plus other effects, dino rampage is 2x worse',
    'Artic': 'automatic cold damage, little cover',
    'Dunes': 'Sand Worms are even bigger, 2x worse',
  }

  def self.random_arena
    place = PLACES.keys.shuffle.first
    danger = DANGERS.keys.shuffle.first
    "#{place} (#{PLACES[place]}), #{danger}, which #{DANGERS[danger]}. FIGHT!"
  end
end
