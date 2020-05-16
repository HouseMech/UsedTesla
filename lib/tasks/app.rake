desc "HelloWorld"
task :hello_world => :environment do
  puts "Hello There"
end


desc "Gets car data from Tesla website"
task :car_data_collector => :environment do
  CarDataCollector.new.call("ms")
  CarDataCollector.new.call("mx")
  CarDataCollector.new.call("m3")
end
