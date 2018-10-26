require 'json'

path = '/Users/etruitte/Desktop/code/cfa/sherpa/sherpa/db/seed_files/Grade_Four.geojson'

data = JSON.parse(File.read(path), symbolize_names: true)

puts data[:type]
puts data[:features].length

FEATURE_KEYS = %i[type properties geometry]
PROP_KEYS = %i[OBJECTID SCHOOL DISTRICT DIST_ID CODE_C CODE_I]

data[:features].each_with_index do |feature, i|
  missing_feature_keys = FEATURE_KEYS - feature.keys
  unless missing_feature_keys.empty?
    puts "feature[#{i}] is missing keys: #{missing_feature_keys.inspect}"
  end

  puts "feature[#{i}] is of type #{feature[:type]}" unless feature[:type] == 'Feature'

  missing_prop_keys = PROP_KEYS - feature[:properties].keys
  unless missing_prop_keys.empty?
    puts "feature[#{i}] properties is missing keys: #{missing_prop_keys.inspect}"
  end

  puts "feature[#{i}] geometry type is #{feature[:geometry][:type]}" unless feature[:geometry][:type] == 'Polygon'
end

puts data[:features][99][:geometry][:type]
puts data[:features][99][:properties].inspect
