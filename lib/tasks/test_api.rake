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

  task :arche => :environment do
    doc = AeDocument.new

    # Operacion getWS
    params = {identificador: '0901ff6b800929c3'}
    # operation = 0 solo metadatos
    # operation = 1 metadatos y  documentos
    response = doc.get_document(params, 1 )
    if response
      puts "Identificador: #{doc.id}"
      puts "Expediente: #{doc.code}"

      puts "Descripcion expediente: #{doc.title}"
      puts "Nombre del doc: #{doc.name}"

      puts "SICIA n: #{doc.sicia_number}"
      puts "Sociedad: #{doc.society_id}"

      puts "Fecha de creación: #{doc.creation_date}"
      puts "Nombre del doc: #{doc.file_name}"
      puts "Extension del doc: #{doc.file_extension}"
      puts "CSV: #{doc.csv}"
    end
  end

end
