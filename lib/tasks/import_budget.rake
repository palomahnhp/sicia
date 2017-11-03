namespace :initialize_trading_year do
  require 'spreadsheet'

  task :budget => :environment do
    ENV['trading_year'] = '2017'
    ENV['filename'] = '/home/phn001/Documents/SICIA/Gastos_V40_2017.xls'
    Rake::Task['initialize_trading_year:budget_codes'].invoke()
  end

  desc "Import estructure from budget http://datos.madrid.es"
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
  end
end
