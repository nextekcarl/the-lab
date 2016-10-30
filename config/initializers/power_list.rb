require "#{Rails.root}/lib/power_list.rb"
PowerList.load(YAML.load_file(Rails.root + 'lib/data/power_list.yml'))
