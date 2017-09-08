# your code goes here
def begins_with_r(array)
  array.all? {|word| word.start_with?("r")}
end

def contain_a(array)
  array.select {|word| word.include?("a")}
end

def first_wa(array)
  array.find {|word| word[0] == "w" and word[1] == "a"}
end

def remove_non_strings(array)
  array.select {|word| word.class == String}
end

def count_elements(hashes)
  new_array = []
  element_count = hashes.collect {|word| hashes.count({:name=>word[:name]})}
  element_count.each_with_index do |count, index|
    new_array << {:name=>hashes[index][:name], :count=>element_count[index]}
  end
  new_array.uniq
end

def merge_data(keys, data)
  new_array = []
  data = data[0]
  data.each_with_index do |hash, index|
    first_name = data.keys[index]
    new_array << {
      :first_name => first_name,
      :awesomeness => data[first_name][:awesomeness],
      :height => data[first_name][:height],
      :last_name => data[first_name][:last_name]
    }
  end
  new_array
end

def find_cool(hash)
  hash.select {|entry| entry[:temperature] == "cool"}
end

def organize_schools(schools)
  city_array = []
  hash = {}
  schools.each_with_index do |school, index|
    city_array << schools[schools.keys[index]][:location]
  end
  city_array.uniq!
  for city in city_array
    hash[city] = []
  end
  for city in city_array
    schools.each_with_index do |school, index|
      if schools[schools.keys[index]][:location] == city
        hash[city] << school[0]
      end
    end
  end
  hash
end
