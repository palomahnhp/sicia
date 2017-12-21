namespace :test_api do

# Parameter: operation=nombre_operacion
# default operation: consulta_organo_aprobacion

  task :sap_ws => :environment do
    sap = SapApi.new
    operation = ENV['operation'].nil? ? 'consulta_centro_gestor' : ENV['operation']
    response = sap.call_operation(operation)
    puts 'Finaliza con respuesta:'
    puts response
  end

end
