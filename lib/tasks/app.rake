desc "HelloWorld"
task :hello_world => :environment do
  puts "Hello There"
end


desc "Gets vehicle data from Tesla website"
task :vehicle_data_collector => :environment do
  VehicleDataCollector.new.call("ms")
  VehicleDataCollector.new.call("mx")
  VehicleDataCollector.new.call("m3")
end
