require "#{Rails.root}/lib/weakness_list.rb"
WeaknessList.load(YAML.load_file(Rails.root + 'lib/data/weakness_list.yml'))
