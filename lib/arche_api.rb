class ArcheApi

  def initialize
    params
  end

  def call_operation(operation, params={})
    message_params = @params
    message_params[:arg0] = message_params[:arg0].merge(params)
    request(operation, message_params)
  end

  def request(operation, message_params)
    response = client.call(operation.to_sym, message: message_params, multipart: true)
    p response
    return response.to_hash[response.to_hash.keys[0]][:return]
  rescue Savon::Error => e
    puts "Error Savon: #{e.inspect} - #{operation} - #{message_params}"
    false
  end

  def client
    Rails.logger.info {"  INFO - archeApi#wsdl: :  #{    wsdl = Rails.application.secrets.arche_api['wsdl']}" }
    @client ||= Savon.client(wsdl:  Rails.application.secrets.arche_api['wsdl']
    )
  end

  private

  def params
    @params ||= {
      arg0: {
        aplicacion:   Rails.application.secrets.arche_api['aplication'],
        localizacion: Rails.application.secrets.arche_api['location'],
        login:        Rails.application.secrets.arche_api['login'],
        password:     Rails.application.secrets.arche_api['password'],
      }
    }
  end

end
