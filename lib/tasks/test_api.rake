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
      doc.add_folder_operation( AeDocument::OPERATION[:normal]) # AeDocument::OPERATION[:eni]
      doc.add_folder_type(AeDocument::TYPE[:folder])
      doc.add_folder_name('Titulo del expediente')
      doc.add_folder_open_date(Date.today())
      doc.add_folder_cod_folder('0501_2018_10000001')
      # Documentos que componene el expediente

      doc.add_document_operation(AeDocument::OPERATION[:normal]) # AeDocument::ENI
      doc.add_document_name('Nombre del documento')
      doc.add_document_type(AeDocument::TYPE[:document])
      doc.add_document_extension('pdf')
      doc.add_document_file_b64()
      doc.add_document_path()

      doc.add_document_date(Date.today)
      doc.add_document_title()

      response = doc.new_document
      p ''
    elsif operacion == :getWS
      # Operacion getWS
      doc.add_operation(AeDocument::OPERATION[:file] ) # AeDocument::OPERATION[:metadata]
      params = {identificador: '0901ff6b800929c3'}
      # type = 0 solo metadatos
      # type = 1 metadatos y  documentos
      response = doc.get_document(params)
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

end
