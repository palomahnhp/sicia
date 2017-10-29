require 'database_cleaner'
Faker::Config.locale = :es

DatabaseCleaner.clean_with :truncation

puts " ✅"

print "Creating Settings"
Setting["ayre_url"] = "http://ayre.munimadrid.es/"
Setting["org_name"] = "Intervención General del Ayuntamiento de Madrid"
Setting["app_name"] = "Sistema Integral de gestión de Control Interno"

puts " ✅"
print "Creating Internal Control Files"
(1..5).each do |n|
  description = Faker::Company.buzzword
  code = description[0...4].upcase

  InternalControlFile.create!(code: code,
                             trading_year: Date.today.year,
                             description: description,
                             created_at: rand((Time.current - 1.week)..Time.current),
                             updated_at:  rand((Time.current - 1.week)..Time.current),
                             updated_by: 'DEV_SEED')
end

puts " ✅"
print "Creating Internal Control Procedures"
(1..5).each do |n|
  description = Faker::Name.title
  InternalControlProcedure.create!(code: n,
                                 trading_year: Date.today.year,
                                 description: description,
                                 file: InternalControlFile.reorder("RANDOM()").first,
                                 created_at: rand((Time.current - 1.week)..Time.current),
                                 updated_at:  rand((Time.current - 1.week)..Time.current),
                                 updated_by: 'DEV_SEED')
end

puts " ✅"
print "Creating Internal Control Actions"
(1..5).each do |n|
  description = Faker::Company.buzzword
  InternalControlAction.create!(code: n,
                                trading_year: Date.today.year,
                                description: description,
                                procedure: InternalControlProcedure.reorder("RANDOM()").first,
                                created_at: rand((Time.current - 1.week)..Time.current),
                                updated_at:  rand((Time.current - 1.week)..Time.current),
                                updated_by: 'DEV_SEED')
end

puts " ✅"

print "Creating Requeriment checks"
(1..25).each do |n|

  if n % 3 == 0
    kind =   'CP'
    description = "Control permanente #{Faker::Company.buzzword}"
    non_observance_level = true
    discrepancy_allowed  = false
  elsif n % 5 == 0
      kind =   'DOC'
      description = "Documento #{Faker::Company.buzzword}"
      non_observance_level = false
      discrepancy_allowed  = false

  else
    kind =   'RB'
    description = "Requisito básico #{Faker::Company.buzzword}"
    non_observance_level = false
    discrepancy_allowed  = true
  end

  check = Requeriment.create!(kind: kind,
                              code: n,
                              trading_year: Date.today.year,
                              description: description,
                              non_observance_level: non_observance_level,
                              discrepancy_allowed: discrepancy_allowed,
                              legal_reference: legal_reference.shuffle.first,
                              created_at: rand((Time.current - 1.week)..Time.current),
                              updated_at: rand((Time.current - 1.week)..Time.current),
                              updated_by: 'DEV_SEED')
end

puts " ✅"
puts "All dev seeds created successfuly "
