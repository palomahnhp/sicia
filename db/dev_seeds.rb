require 'database_cleaner'
Faker::Config.locale = :es

DatabaseCleaner.clean_with :truncation

puts " ✅"

print "Creating Settings"
Setting["ayre_url"] = "http://ayre.munimadrid.es/"
Setting["org_name"] = "Intervención General del Ayuntamiento de Madrid"
Setting["app_name"] = "Sistema Integral de gestión de Control Interno"

puts " ✅"
print "Creating Internal Control Areas"
(1..5).each do |n|
  description = Faker::Company.buzzword[2]
  area = InternalControlArea.create!(code: description[0..-4].upcase,
                                     trading_year: Date.today.year,
                                     description: description,
                                     created_at: rand((Time.current - 1.week)..Time.current),
                                     updated_at:  rand((Time.current - 1.week)..Time.current),
                                     updated_by: 'DEV_SEED')
end

puts " ✅"
print "Creating Internal Control Procedures"
(1..5).each do |n|
  description = Faker::Name.title.level
  area = InternalControlProcedure.create!(code: n,
                                     trading_year: Date.today.year,
                                     description: description,
                                     created_at: rand((Time.current - 1.week)..Time.current),
                                     updated_at:  rand((Time.current - 1.week)..Time.current),
                                     updated_by: 'DEV_SEED')
end

puts " ✅"
print "Creating Internal Control Actions"
(1..5).each do |n|
  description = Faker::Company.buzzword
  area = InternalControlProcedure.create!(code: n,
                                          trading_year: Date.today.year,
                                          description: description,
                                          created_at: rand((Time.current - 1.week)..Time.current),
                                          updated_at:  rand((Time.current - 1.week)..Time.current),
                                          updated_by: 'DEV_SEED')
end

puts " ✅"
puts "All dev seeds created successfuly "