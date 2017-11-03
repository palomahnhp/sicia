namespace :import do
  require 'spreadsheet'

  task :budget => :environment do
    ENV['trading_year'] = '2017'
    ENV['filename'] = Rails.root.join('public', 'load', 'Gastos_V40_2017.xls').to_s
    Rake::Task['import:budget_codes'].invoke()
  end

  desc "Import structure from budget http://datos.madrid.es"
  task budget_codes: :environment do
    puts 'Importing manager_body, programa, economic ...'
    if ENV['trading_year'].nil? || ENV['filename'].nil?
      p '**'
      p '** ERROR: debe indicar trading_year y file: rake import:budget_codes trading_year=2017 filename=presupuestos-2017.xls'
      p '**'
      exit
    end

    trading_year = ENV['trading_year'].to_i
    book  = Spreadsheet.open ENV['filename']
    sheet = book.worksheet 0
    ManagerBody.where(trading_year: trading_year).delete_all

    (sheet.rows).each do |row|
      next if row.idx == 0
      ManagerBody.find_or_create_by!(trading_year: trading_year,
                                     code: row[0] + row[2],
                                     budget_center: row[1],
                                     budget_section: row[3]
      )
    end
    p '.. manager bodies updated ' + ManagerBody.where(trading_year: trading_year).count.to_s + ' regs.'
  end

  task :sap_tables => :environment do
    ENV['trading_year'] = '2017'
    ENV['filename'] = Rails.root.join('public', 'load', 'TablasSAP.xls').to_s
    Rake::Task['import:sap_tables'].invoke()
  end

  desc "Import om budget http://datos.madrid.es"
  task sap_tables: :environment do
    puts 'Importing sap_tables ...'
    if ENV['trading_year'].nil? || ENV['filename'].nil?
      p '**'
      p '** ERROR: debe indicar trading_year y file: rake import:budget_codes trading_year=2017 filename=presupuestos-2017.xls'
      p '**'
      exit
    end
    trading_year = ENV['trading_year'].to_i
    book  = Spreadsheet.open ENV['filename']

    print ' ... Approval bodies ...'
    sheet = book.worksheet 0
    SapCode.where(sap_field: 'ORGAPRO').delete_all

    (sheet.rows).each do |row|
      next if row.idx == 0
      SapCode.find_or_create_by!(sap_field: 'ORGAPRO',
                      sicia_att: 'approval_body',
                      code: row[0],
                      description: row[4],
                      updated_by: 'IMPORT'
      )
    end
    p ' updated ' + SapCode.where(sap_field: 'ORGAPRO').count.to_s + ' regs.'

    print ' ... Contract type ...'
    sheet = book.worksheet 1
    SapCode.where(sap_field: 'TIPOCONTRATO').delete_all

    (sheet.rows).each do |row|
      next if row.idx == 0
      SapCode.find_or_create_by!(sap_field: 'TIPOCONTRATO',
                                 sicia_att: 'contract_type',
                                 code: row[0],
                                 description: row[2],
                                 updated_by: 'IMPORT'
      )
    end

    p ' updated ' + SapCode.where(sap_field: 'TIPOCONTRATO').count.to_s + ' regs.'

    print ' ... Adjudication way ...'
    sheet = book.worksheet 2
    SapCode.where(sap_field: 'FORMA_ADJUD').delete_all

    (sheet.rows).each do |row|
      next if row.idx == 0
      SapCode.find_or_create_by!(sap_field: 'FORMA_ADJUD',
                                 sicia_att: 'adjudication_way',
                                 code: row[0],
                                 description: row[1],
                                 updated_by: 'IMPORT'
      )
    end
    p ' updated ' + SapCode.where(sap_field: 'FORMA_ADJUD').count.to_s + ' regs.'

  end
end
