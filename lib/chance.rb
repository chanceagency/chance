chance_lib_dir = File.expand_path(File.dirname(__FILE__)) + "/chance/"

# TODO: Make core extensions NOT loaded by default— should be configurable, to play nicely with other libs.
['core_extensions', 'percentage', 'chance'].each {|filename| require chance_lib_dir + filename}
