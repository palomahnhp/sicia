require 'database_cleaner'
Faker::Config.locale = :es

DatabaseCleaner.clean_with :truncation

Rake::Task["db:seed"].invoke

puts " ✅"

print "Creating Settings"
Setting["ayre_url"] = "http://ayre.munimadrid.es/"
Setting["org_name"] = "Intervención General del Ayuntamiento de Madrid"
Setting["app_name"] = "Sistema Integral de gestión de Control Interno"

puts " ✅"
print "Creating Internal Control Types"
(1..3).each do |n|
  description = 'Expediente tipo ' + n.to_s
  code = description[0...3].upcase + n.to_s

  ic_file = InternalControlFile.create!(code: code,
                             trading_year: Date.today.year,
                             description: description,
                             created_at: rand((Time.current - 1.week)..Time.current),
                             updated_at:  rand((Time.current - 1.week)..Time.current),
                             updated_by: 'DEV_SEED')

  (1..3).each do |m|
    description = 'Procedimiento ' +  ic_file.code  + '.' + m.to_s
    ic_procedure = InternalControlProcedure.create!(code: m,
                                     trading_year: Date.today.year,
                                     description: description,
                                     internal_control_file: ic_file,
                                     created_at: rand((Time.current - 1.week)..Time.current),
                                     updated_at:  rand((Time.current - 1.week)..Time.current),
                                     updated_by: 'DEV_SEED')

    (1..3).each do |o|
      description = 'Tramite ' +  ic_file.code  + '.' + m.to_s + '.' + o.to_s
      InternalControlAction.create!(code: o,
                                       trading_year: Date.today.year,
                                       description: description,
                                       internal_control_procedure: ic_procedure,
                                       created_at: rand((Time.current - 1.week)..Time.current),
                                       updated_at: rand((Time.current - 1.week)..Time.current),
                                       updated_by: 'DEV_SEED')
    end
  end
end

puts " ✅"

print "Creating Requeriment"
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
print "Creating contract Types: "
print "TIPOCONTRATO"

SapCode.create!(sap_field: 'TIPOCONTRATO', code: '05', description: 'Contrato de servicios', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', code: '06', description: 'Contrato de concesiones de obras pública', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', code: '07', description: 'Contrato administrativo especial', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', code: '26', description: 'Contrato colaboración s.publ. y s.priv.', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'TIPOCONTRATO', code: '20', description: 'Convenios', updated_by: 'DEV_SEEDS' )

puts " ✅"
print "Creating adjudication way: "
print "FORMA_ADJUD"

SapCode.create!(sap_field: 'FORMA_ADJUD', code: '1', description: 'Concurso abierto', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'FORMA_ADJUD', code: '3', description: 'Concurso restringido', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'FORMA_ADJUD', code: '5', description: 'Subasta abierta', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'FORMA_ADJUD', code: '7', description: 'Subasta restrigida', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'FORMA_ADJUD', code: '9', description: 'Negociado sin publicidad', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'FORMA_ADJUD', code: '11', description: 'Negociado con publicidad', updated_by: 'DEV_SEEDS' )
SapCode.create!(sap_field: 'FORMA_ADJUD', code: '13', description: 'Contrato menor', updated_by: 'DEV_SEEDS' )


puts " ✅"
puts "All dev seeds created successfuly "
