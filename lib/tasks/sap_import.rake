namespace :sap_import do
  require 'spreadsheet'
#
# Import data from SAP WS
#

  desc "Import societies"
  task :societies => :environment do
    operation = 'consulta_sociedades'
    response = call_sap(operation)
    p 'Importing societies, updating : ' + response.count.to_s + ' regs...'

    response.each do |sap_society|
      society = Society.find_or_create_by(code: sap_society[:id_sociedad])
      society.description  = sap_society[:descripcion] unless society.description  == sap_society[:descripcion]
      society.save if society.changed?
    end
    p 'End SAP import: SOCIETIES'
  end

  desc "Import manager bodies"
  task :manager_bodies => :environment do
    operation = 'consulta_centro_gestor'
    response = call_sap(operation)
    p 'Importing manager bodies, updating : ' + response.count.to_s + ' regs...'
    response.each do |sap_manager_body|
      manager_body = ManagerBody.find_or_create_by(trading_year: set_trading_year, code: sap_manager_body[:id_centro_gestor],
                                                   description: sap_manager_body[:descripcion], society: Society.find_by_code(sap_manager_body[:id_sociedad]))
      manager_body.description  = sap_manager_body[:descripcion] unless manager_body.description  == sap_manager_body[:descripcion]
      manager_body.save if manager_body.changed?
    end

  end

  desc "Import approval bodies"
  task :approval_bodies => :environment do
    operation = 'consulta_organo_aprobacion'
    response = call_sap(operation)
    p 'Importing approval bodies, updating : ' + response.count.to_s + ' regs...'
    response.each do |sap_approval_body|
      approval_body = ApprovalBody.find_or_create_by(trading_year: set_trading_year, code: sap_approval_body[:id_organo_aprobacion],
                                                   description: sap_approval_body[:descripcion])
      approval_body.description  = sap_approval_body[:descripcion] unless approval_body.description  == sap_approval_body[:descripcion]
      approval_body.valid_to  = sap_approval_body[:fecha_validez]  unless approval_body.valid_to  == sap_approval_body[:fecha_validez]
      approval_body.save if approval_body.changed?
    end
  end

  desc "Import adjudication way"
  task :adjudication_ways => :environment do
    operation = 'consulta_forma_adjudicacion'
    response = call_sap(operation)
    p 'Importing adjudication ways, updating : ' + response.count.to_s + ' regs...'

    response.each do |sap_adjudication_way|
      adjudication_way = SapCode.find_or_create_by(sap_field: 'FORMA_ADJUD', sicia_att: 'adjudication_way',
                                          code: sap_adjudication_way[:id_forma_adjudicacion])
      adjudication_way.description  = sap_adjudication_way[:descripcion] unless adjudication_way.description  == sap_adjudication_way[:descripcion]
      if adjudication_way.changed?
        adjudication_way.updated_by = "SAP"
        adjudication_way.save
      end
    end
    p 'End SAP import: Adjudication ways'
  end

  desc "Import contract type"
  task :contract_types => :environment do
    operation = 'consulta_tipo_contrato'
    response = call_sap(operation)
    p 'Importing contract type, updating : ' + response.count.to_s + ' regs...'
    p response
    response.each do |sap_contract_type|
      contract_type = SapCode.find_or_create_by(sap_field: 'TIPO_CONTRATO', sicia_att: 'contract_type',
                                                   code: sap_contract_type[:id_forma_adjudicacion])
      contract_type.description  = sap_contract_type[:descripcion] unless contract_type.description  == sap_contract_type[:descripcion]
      if contract_type.changed?
        contract_type.updated_by = "SAP"
        contract_type.save
      end
    end
    p 'End SAP import: Adjudication ways'
  end

  private

  def call_sap(operation)
    sap_api = SapApi.new
    response = sap_api.call_operation(operation)
  end

  def set_trading_year
    @trading_year ||= ENV['trading_year'].nil? ? Date.today.year : ENV['trading_year']
  end

end

