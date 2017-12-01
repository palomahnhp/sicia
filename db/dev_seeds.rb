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
print "Creating Internal Control Types"
descriptions = %w[Contratación Obras Compras Suministros]
(0..3).each do |n|
  description = descriptions[n]
  code = description[0...4].upcase

  ic_file = IcFile.create!(code: code,
                           trading_year: Date.today.year,
                           description: description,
                           created_at: rand((Time.current - 1.week)..Time.current),
                           updated_at:  rand((Time.current - 1.week)..Time.current),
                           updated_by: 'DEV_SEED')

  (1..3).each do |m|
    description = 'Proc. de ' +  ic_file.code  + '.' + m.to_s
    ic_procedure = IcProcedure.create!(code: m,
                                       trading_year: Date.today.year,
                                       description: description,
                                       internal_control_file: ic_file,
                                       created_at: rand((Time.current - 1.week)..Time.current),
                                       updated_at:  rand((Time.current - 1.week)..Time.current),
                                       updated_by: 'DEV_SEED')

    (1..3).each do |o|
      description = 'Tramite de ' +  ic_procedure.description  + '.' + m.to_s + '.' + o.to_s
      ac = IcAction.create!(code: o,
                            trading_year: Date.today.year,
                            description: description,
                            internal_control_procedure: ic_procedure,
                            created_at: rand((Time.current - 1.week)..Time.current),
                            updated_at: rand((Time.current - 1.week)..Time.current),
                            updated_by: 'DEV_SEED')

      ac.requeriment = Requeriment.all.reorder("RANDOM()").first

    end
  end
end

puts " ✅"

print "Creating Proposals"
i
(77067819..77067850).each do |n|
  proposal = Proposal.new(sap_proposal: n)
  proposal.fill_sap_proposal(n)
  proposal.notify_to = 'notificarme@mail.com'
  proposal.notify_to_confirmation = 'notificarme@mail.com'
  proposal.internal_control_file      = IcFile.all.reorder("RANDOM()").first
  proposal.internal_control_procedure = proposal.internal_control_file.internal_control_procedures.reorder("RANDOM()").first
  proposal.internal_control_action    = proposal.internal_control_procedure.internal_control_actions.reorder("RANDOM()").first
  proposal.save
end

puts " ✅"
puts "All dev seeds created successfuly "
