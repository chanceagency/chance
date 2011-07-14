chance_lib_dir = File.expand_path(File.dirname(__FILE__)) + "/chance/"
['core_extensions', 'percentage', 'chance'].each {|filename| require chance_lib_dir + filename}
