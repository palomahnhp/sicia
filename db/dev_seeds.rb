require 'database_cleaner'
Faker::Config.locale = :es

DatabaseCleaner.clean_with :truncation

puts " ✅"

print "Creating Settings"
Setting["ayre_url"] = "http://ayre.munimadrid.es/"
Setting["org_name"] = "Intervención General del Ayuntamiento de Madrid"
Setting["app_name"] = "Sistema Integral de gestión de Control Interno"

puts " ✅"
print "Creating Internal Control Types"
(1..3).each do |n|
  description = 'Expediente_tipo_' + n.to_s
  code = description[0...3].upcase + n.to_s

  ic_file = InternalControlFile.create!(code: code,
                             trading_year: Date.today.year,
                             description: description,
                             created_at: rand((Time.current - 1.week)..Time.current),
                             updated_at:  rand((Time.current - 1.week)..Time.current),
                             updated_by: 'DEV_SEED')
  (1..3).each do |m|
    description = 'Procedimiento_' + ic_file.code  + '_' + m.to_s
    ic_procedure = InternalControlProcedure.create!(code: m,
                                     trading_year: Date.today.year,
                                     description: description,
                                     internal_control_file: ic_file,
                                     created_at: rand((Time.current - 1.week)..Time.current),
                                     updated_at:  rand((Time.current - 1.week)..Time.current),
                                     updated_by: 'DEV_SEED')
    (1..3).each do |o|
      description = 'Tramite_' + ic_file.code  + '.' + m.to_s + '.' + o.to_s
      InternalControlAction.create!(code: o,
                                       trading_year: Date.today.year,
                                       description: description,
                                       internal_control_procedure: ic_procedure,
                                       created_at: rand((Time.current - 1.week)..Time.current),
                                       updated_at:  rand((Time.current - 1.week)..Time.current),
                                       updated_by: 'DEV_SEED')

    end
  end
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

  Requeriment.create!(kind: kind,
                      code: n,
                      trading_year: Date.today.year,
                      description: description,
                      non_observance_level: non_observance_level,
                      discrepancy_allowed: discrepancy_allowed,
                      created_at: rand((Time.current - 1.week)..Time.current),
                      updated_at: rand((Time.current - 1.week)..Time.current),
                      updated_by: 'DEV_SEED')
end

puts " ✅"
puts "All dev seeds created successfuly "
