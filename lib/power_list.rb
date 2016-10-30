class PowerList
  #TODO: Some of these will have subselects that need to generated.
  #TODO: Some will have options, like subselects that modify the power.
  #TODO: Some will have limitation, which have a chance of being applied
  def self.load(hash)
    @@powers = hash
    @@categorized = {}
    @@categorized['universal'] = []
    #TODO: Build hash of categories and the powers that fit in
    @@powers.keys.each do |id|
      @@categorized['universal'] << @@powers[id]
      @@powers[id]['categories'].each do |category|
        @@categorized[category] = [] unless @@categorized[category]
        @@categorized[category] << @@powers[id]
      end
    end
    @@universal_modifiers = [
      'subtle', #Effects hidden when used
      'increased area of effect', #single target to small area to large to huge
      'indirect', #Effect doesn't have to come from the user to the target
      'overwhelming', #difficult to resist, immunity reduced to resistance
      'exceptionally flashy' #Side effects make power use more obvious than normal
    ]
  end

  def self.random_select
    power_details = ''
    random_power = @@powers.keys.shuffle.first
    description = ''
    #TODO: Figure out good way to build up final product.
    #Step through subselect options, limitations, etc.
    power_details += "#{@@powers[random_power]['name']}"
    unless @@powers[random_power]['subselect'].nil?
      power_details += ", #{@@powers[random_power]['subselect'].shuffle.first}"
    end
    while roll('1d100') < 10
      power_details += " (#{@@universal_modifiers.shuffle.first})"
    end
    unless @@powers[random_power]['limitations'].nil?
      if roll('1d100') < @@powers[random_power]['limitation_chance']
        limitation = "#{@@powers[random_power]['limitations'].shuffle.first}"
      end
    end
    description = @@powers[random_power]['description']
    return power_details, limitation, description
  end

  def self.powers
    @@powers
  end
  def self.categories
    @@categorized
  end
end
