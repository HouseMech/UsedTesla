desc "HelloWorld"
task :hello_world => :environment do
  puts "Hello There"
end


desc "Gets Model S data from Tesla website"
task :car_data_collector => :environment do
  ModelSDataCollector.new.call
  ModelXDataCollector.new.call
  ModelThreeDataCollector.new.call
end
