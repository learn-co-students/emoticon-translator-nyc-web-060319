require "yaml"

def load_library(file_path)
  dict = YAML.load_file(file_path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  
  dict.each do |meaning, array|
    new_hash["get_meaning"][array[1]] = meaning
    new_hash["get_emoticon"][array[0]] = array[1]
  end
  return new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  dict = load_library(file_path)
  to_ret = dict["get_emoticon"][emoticon]

  if to_ret != nil
    return to_ret
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  dict = load_library(file_path)
  to_ret = dict["get_meaning"][emoticon]

  if to_ret != nil
    return to_ret
  end
  
  return "Sorry, that emoticon was not found"
end

