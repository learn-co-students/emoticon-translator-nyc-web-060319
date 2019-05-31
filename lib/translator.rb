# require modules here
require "pry"
require "yaml"

def load_library(path)
  emoticon_spec = YAML.load_file(path)
  return_hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  emoticon_spec.keys.each do |emoticon_meaning|
    return_hash["get_meaning"][emoticon_spec[emoticon_meaning][1]] = emoticon_meaning
  end

  emoticon_spec.keys.each do |emoticon_meaning|
    return_hash["get_emoticon"][emoticon_spec[emoticon_meaning][0]] = emoticon_spec[emoticon_meaning][1] 
  end
  #binding.pry
  #backwards_spec = emoticon_spec.invert
  #backwards_spec.keys.each do |emoticon_array|
    #return_hash["get_emoticon"][emoticon_array[1]] = backwards_spec[emoticon_array]
  #end
  return_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_lib = load_library(path)
  translated_emoticon = emoticon_lib["get_emoticon"][emoticon]
  if translated_emoticon == nil
    return "Sorry, that emoticon was not found"
  end
  translated_emoticon
end

def get_english_meaning(path, emoticon)
  emoticon_lib = load_library(path)
  translated_emoticon = emoticon_lib["get_meaning"][emoticon]
  if translated_emoticon == nil
    return "Sorry, that emoticon was not found"
  end
  translated_emoticon
end