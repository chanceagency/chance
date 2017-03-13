def rain
   "'|'|'|'|'|'|'|'"
end

def snow
   ".*.*.*.*.*.*.*."
end

24.times do |hour|
  weather = [ 60.percent.chance.of {rain}, 10.percent.chance.of {snow} ]
  puts [ hour, weather ].join(' ')
end