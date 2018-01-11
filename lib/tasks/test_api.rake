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
    operacion = :newWS

    if operacion == :newWS
      # Operacion newWS

      # Datos del expediente
      doc.add_folder_property('operacion', AeDocument::OPERATION[:normal]) # AeDocument::OPERATION[:eni]
      doc.add_folder_property('tipo', AeDocument::AeDocument::TYPE[:folder]) # AeDocument::OPERATION[:eni]
      doc.add_folder_property('nombre', 'Titulo del expediente') # AeDocument::OPERATION[:eni]
      doc.add_folder_attribute('cod_expediente', '0501_2018_10000001') # AeDocument::OPERATION[:eni]
      doc.add_folder_attribute('fecha_apertura', Date.today()) # AeDocument::OPERATION[:eni]

      # Documentos que componen el expediente
      doc.add_document_property('operacion', AeDocument::OPERATION[:normal]) # AeDocument::ENI
      doc.add_document_property('nombre','Nombre del documento')
      doc.add_document_property('tipo', AeDocument::TYPE[:document])
      doc.add_document_property('extension', 'pdf')
#      doc.add_document_property('fichero', '')
#      doc.add_document_property('rutaFichero', '')
      doc.add_document_attribute('fecha_documento', Date.today)
      doc.add_document_attribute('title', Date.today)

      response = doc.new_document
      if doc.error?
        puts "AeDocument::NewDocument: #{doc.error_message} parámetros: #{doc.parameters}"
      else
        p response
      end

    elsif operacion == :getWS
      # Operacion getWS
      doc.add_property('operacion', AeDocument::OPERATION[:metadata] ) # AeDocument::OPERATION[:file]
      doc.add_criterion('identificador', '0901ff6b800929c3')

      doc.get_document

      if doc.error?
        puts "AeDocument::GetDocument: #{doc.error_message} parámetros: #{doc.parameters}"
      else
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

end
