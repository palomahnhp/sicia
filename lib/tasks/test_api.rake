namespace :test_api do

  task :sap_ws => :environment do
    puts Rails.application.secrets
    sap = SapApi.new
    operation = 'consulta_exp_formas_adjudicacion'
    response = sap.call_operation(operation)
    puts 'Finaliza'
  end

end
