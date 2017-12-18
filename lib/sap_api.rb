class SapApi

  def initialize(param=nil)
    @realm = Base64.strict_encode64("#{Rails.application.secrets.sap_api['user']}:#{Rails.application.secrets.sap_api['password']}")
    @params = params(param)
  end

  def call_operation(service)
    @service = service
    operation = Rails.application.secrets.sap_api[service]['operation']
    message_params = @params
    request(operation, message_params)
  end

  def request(operation, message_params)
    response = client.call(operation.to_sym, message: message_params).body
    response[Rails.application.secrets.sap_api[@service]['return'].to_sym][Rails.application.secrets.sap_api[@service]['elements'].to_sym]
  rescue Savon::Error => e
    puts "#{operation} - #{message_params} - Error Savon: #{e}"
    false
  end

  def client
    Rails.logger.info {"  INFO - SAPApi#wsdl: :  #{    wsdl = Rails.application.secrets.sap_api[@service]['wsdl']}" }
    @client = Savon.client(
      wsdl:  Rails.application.secrets.sap_api[@service]['wsdl'],
      headers: {'Authorization' => "Basic #{@realm}"}
    )
  end

  private

  def params(param=nil )
   @params = param
  end
end
