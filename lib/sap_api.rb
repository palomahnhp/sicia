class SapApi

  def initialize(param=nil)
    @realm = Base64.strict_encode64("#{Rails.application.secrets.sap_api['user']}:#{Rails.application.secrets.sap_api['password']}")
    @params = params(param)
  end

  def call_operation(operation)
    @wsdl = Rails.application.secrets.sap_api[operation]['wsdl']
    p "wsdl: #{@wsdl}"

    operation = Rails.application.secrets.sap_api[operation]['operation']
    p "operation: #{operation}"
    message_params = @params
    request(operation.to_sym, message_params)
  end

  def request(operation, message_params)
    response = client.call(operation.to_sym, message: message_params).body
    parsed_response = parser.parse(response[(operation.to_s + '_response').to_sym][(operation.to_s + '_return').to_sym])
  rescue Savon::Error => e
    puts "#{operation} - #{message_params} - Error Savon: #{e}"
    false
  end

  def client
    Rails.logger.info {"  INFO - SAPApi#wsdl: :  #{@wsdl.to_s}" }

    @client = Savon.client(
      wsdl: @wsdl,
      headers: {'Authorization' => "Basic #{@realm}"}
    )

  end

  private

  def parser
    @parser ||= Nori.new
  end

  def params(param=nil )
    if param.nil?
      @params ||= {
        ConsultaGeneral: ''
      }
    end
  end
end
