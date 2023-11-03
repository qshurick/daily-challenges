require "./hello_world.rb"
require "./pronic.rb"

hello_world

puts "%d is pronic %s" % [0, is_pronic(0)]
puts "%d is pronic %s" % [2, is_pronic(2)]
puts "%d is pronic %s" % [7, is_pronic(7)]
puts "%d is pronic %s" % [110, is_pronic(110)]
puts "%d is pronic %s" % [136, is_pronic(136)]
puts "%d is pronic %s" % [156, is_pronic(156)]
