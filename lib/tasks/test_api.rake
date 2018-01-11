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
      doc.add_folder_property('nombre', 'Expediente enviado desde SICIA') # AeDocument::OPERATION[:eni]
      doc.add_folder_attribute('cod_expediente', '0501_2018_10000001') # AeDocument::OPERATION[:eni]
      doc.add_folder_attribute('fecha_apertura', '12/01/2017') # AeDocument::OPERATION[:eni]

      # Documentos que componen el expediente
      doc.add_document_property('operacion', AeDocument::OPERATION[:normal]) # AeDocument::ENI
      doc.add_document_property('nombre','Nombre del documento')
      doc.add_document_property('tipo', AeDocument::TYPE[:document])
      doc.add_document_property('extension', 'pdf')
#      doc.add_document_property('fichero', '')
#      doc.add_document_property('rutaFichero', '')
      doc.add_document_attribute('fecha_documento', '12/01/2017')
      doc.add_document_attribute('title', '12/01/2017')

      response = doc.new_document
      if doc.error?
        puts "AeDocument::NewDocument: #{doc.error_message} parámetros: #{doc.parameters}"
      else
        p response
#{:resultado=>true, :documentos=>{:atributos=>[{:clave=>"regulacion_csv", :valores=>"Ayuntamiento de Madrid"}, {:clave=>"funcion", :valores=>"04.01.PRESUPUESTOS_Y_CONTROL_FINANCIERO"}, {:clave=>"csv", :valores=>"0901FF6B800933AB"}, {:clave=>"proceso", :valores=>"04.01.03.INFORMES_DE_CONTROL_INTERNO"}, {:clave=>"area", :valores=>"04.HACIENDA"}, {:clave=>"r_object_id", :valores=>"0901ff6b800933ab"}, {:clave=>"cod_expediente", :valores=>"0501_2018_10000001"}, {:clave=>"aplicacion", :valores=>"SICIA"}, {:clave=>"fecha_documento", :valores=>"12/01/2017"}, {:clave=>"title", :valores=>"12/01/2017"}, {:clave=>"tipo_firma", :valores=>"CSV"}, {:clave=>"version_nti", :valores=>"1.0"}, {:clave=>"serie", :valores=>"04.01.03.01.EXPEDIENTES_DE_INFORMES_DE_CONTROL_INTERNO"}, {:clave=>"id_dctm", :valores=>"0901ff6b800933ab"}, {:clave=>"id_nti", :valores=>nil}, {:clave=>"r_object_type", :valores=>"ayto_d_archivo"}], :identificador=>"0901ff6b800933ab", :nombre=>"Nombre del documento"}, :expediente=>{:atributos=>[{:clave=>"r_creation_date", :valores=>"12/01/2018 13:20:55"}, {:clave=>"a_is_hidden", :valores=>"0"}, {:clave=>"r_modifier", :valores=>"ayto_usr_04010301_w"}, {:clave=>"fecha_cierre", :valores=>nil}, {:clave=>"r_folder_path", :valores=>"/04.HACIENDA/04.01.PRESUPUESTOS_Y_CONTROL_FINANCIERO/04.01.03.INFORMES_DE_CONTROL_INTERNO/04.01.03.01.EXPEDIENTES_DE_INFORMES_DE_CONTROL_INTERNO/2018/12/01/0501_2018_10000001"}, {:clave=>"a_compound_architecture", :valores=>nil}, {:clave=>"fecha_apertura", :valores=>"01/12/2018 00:00:00"}, {:clave=>"a_is_template", :valores=>"0"}, {:clave=>"i_chronicle_id", :valores=>"0b01ff6b80093363"}, {:clave=>"clasificacion", :valores=>nil}, {:clave=>"acl_domain", :valores=>"repositorioAEDOCDes"}, {:clave=>"a_category", :valores=>nil}, {:clave=>"i_reference_cnt", :valores=>"1"}, {:clave=>"fecha_expurgo", :valores=>nil}, {:clave=>"acl_name", :valores=>"ayto_acl_04010301"}, {:clave=>"fecha_transferencia", :valores=>nil}, {:clave=>"owner_permit", :valores=>"1"}, {:clave=>"r_full_content_size", :valores=>"0.0"}, {:clave=>"a_last_review_date", :valores=>nil}, {:clave=>"subject", :valores=>nil}, {:clave=>"i_ancestor_id", :valores=>["0c01ff6b8008fd73", "0b01ff6b800873f2", "0b01ff6b800873f4", "0b01ff6b80093363", "0b01ff6b80093366", "0b01ff6b80093365", "0b01ff6b80093364", "0b01ff6b800873f5"]}, {:clave=>"i_folder_id", :valores=>"0b01ff6b80093364"}, {:clave=>"i_is_replica", :valores=>"0"}, {:clave=>"subserie", :valores=>nil}, {:clave=>"r_current_state", :valores=>"0"}, {:clave=>"a_link_resolved", :valores=>"0"}, {:clave=>"id_nti", :valores=>nil}, {:clave=>"id_transferencia", :valores=>nil}, {:clave=>"i_has_folder", :valores=>"1"}, {:clave=>"r_has_events", :valores=>"0"}, {:clave=>"group_name", :valores=>"ayto_gr_04010301_w"}, {:clave=>"i_latest_flag", :valores=>"1"}, {:clave=>"ciclo_vida", :valores=>nil}, {:clave=>"title", :valores=>nil}, {:clave=>"r_access_date", :valores=>nil}, {:clave=>"r_frozen_flag", :valores=>"0"}, {:clave=>"a_content_type", :valores=>nil}, {:clave=>"estado", :valores=>"ABIERTO"}, {:clave=>"world_permit", :valores=>"1"}, {:clave=>"proceso", :valores=>"04.01.03.INFORMES_DE_CONTROL_INTERNO"}, {:clave=>"r_creator_name", :valores=>"ayto_usr_04010301_w"}, {:clave=>"a_is_signed", :valores=>"0"}, {:clave=>"language_code", :valores=>nil}, {:clave=>"r_immutable_flag", :valores=>"0"}, {:clave=>"version_nti", :valores=>nil}, {:clave=>"serie", :valores=>"04.01.03.01.EXPEDIENTES_DE_INFORMES_DE_CONTROL_INTERNO"}, {:clave=>"organo", :valores=>nil}, {:clave=>"a_full_text", :valores=>"1"}, {:clave=>"i_contents_id", :valores=>"0000000000000000"}, {:clave=>"object_name", :valores=>"0501_2018_10000001"}, {:clave=>"r_lock_owner", :valores=>nil}, {:clave=>"i_is_reference", :valores=>"0"}, {:clave=>"area", :valores=>"04.HACIENDA"}, {:clave=>"r_object_id", :valores=>"0b01ff6b80093363"}, {:clave=>"a_status", :valores=>nil}, {:clave=>"r_is_public", :valores=>"0"}, {:clave=>"volumen", :valores=>nil}, {:clave=>"r_alias_set_id", :valores=>"0000000000000000"}, {:clave=>"i_partition", :valores=>"0"}, {:clave=>"owner_name", :valores=>"ayto_usr_04010301_w"}, {:clave=>"i_is_deleted", :valores=>"0"}, {:clave=>"a_storage_type", :valores=>nil}, {:clave=>"resolution_label", :valores=>nil}, {:clave=>"i_vstamp", :valores=>"1"}, {:clave=>"r_resume_state", :valores=>"0"}, {:clave=>"r_content_size", :valores=>"0"}, {:clave=>"r_lock_date", :valores=>nil}, {:clave=>"log_entry", :valores=>nil}, {:clave=>"i_retain_until", :valores=>nil}, {:clave=>"r_policy_id", :valores=>"0000000000000000"}, {:clave=>"i_antecedent_id", :valores=>"0000000000000000"}, {:clave=>"a_special_app", :valores=>nil}, {:clave=>"r_version_label", :valores=>["1.0", "CURRENT"]}, {:clave=>"valor", :valores=>nil}, {:clave=>"funcion", :valores=>"04.01.PRESUPUESTOS_Y_CONTROL_FINANCIERO"}, {:clave=>"r_modify_date", :valores=>"12/01/2018 13:20:55"}, {:clave=>"a_retention_date", :valores=>nil}, {:clave=>"r_link_cnt", :valores=>"1"}, {:clave=>"r_has_frzn_assembly", :valores=>"0"}, {:clave=>"r_assembled_from_id", :valores=>"0000000000000000"}, {:clave=>"a_controlling_app", :valores=>nil}, {:clave=>"group_permit", :valores=>"6"}, {:clave=>"r_is_virtual_doc", :valores=>"0"}, {:clave=>"r_lock_machine", :valores=>nil}, {:clave=>"i_branch_cnt", :valores=>"0"}, {:clave=>"r_frzn_assembly_cnt", :valores=>"0"}, {:clave=>"a_archive", :valores=>"0"}, {:clave=>"r_link_high_cnt", :valores=>"0"}, {:clave=>"r_page_cnt", :valores=>"0"}, {:clave=>"a_application_type", :valores=>nil}, {:clave=>"r_object_type", :valores=>"ayto_f_archivo"}, {:clave=>"cod_expediente", :valores=>"0501_2018_10000001"}, {:clave=>"i_direct_dsc", :valores=>"0"}, {:clave=>"cod_serie", :valores=>"04.01.03.01"}, {:clave=>"i_cabinet_id", :valores=>"0c01ff6b8008fd73"}], :identificador=>"0b01ff6b80093363", :nombre=>"0501_2018_10000001"}}
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
