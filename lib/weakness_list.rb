class WeaknessList
  def self.load(hash)
    @@weaknesses = hash
    @@categorized = {}
    @@categorized['universal'] = []
    #TODO: Build hash of categories and the powers that fit in
    @@weaknesses.keys.each do |id|
      @@categorized['universal'] << @@weaknesses[id]
      @@weaknesses[id]['categories'].each do |category|
        @@categorized[category] = [] unless @@categorized[category]
        @@categorized[category] << @@weaknesses[id]
      end
    end
  end

  def self.random_select(category = nil)
    weakness_details = ''
    if category.nil?
      random_weakness = @@weaknesses[@@weaknesses.keys.shuffle.first]
    else
      random_weakness = @@categorized[category].shuffle.first
    end
    weakness_details += "#{random_weakness['name']}"
    unless random_weakness['subselect'].nil?
      weakness_details += ", #{random_weakness['subselect'].shuffle.first}"
    end
    description = random_weakness['description']
    return weakness_details, description
  end

  def self.weaknesses
    @@weaknesses
  end
  def self.categories
    @@categorized
  end
end
