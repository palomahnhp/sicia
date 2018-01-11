class AeDocument

  attr_accessor :operation, :response_data

  TYPE = {document: 'ayto_d_archivo', folder: 'ayto_f_archivo', work_folder: 'dm_folder'}
  OPERATION = {normal: 0, eni: 1, metadata: 0, file:1, file_sign: 1, file_eni: 2, validation_eni:3}
  REQUIRED = {getWS: [:criterio],
              newWS: [expediente: [:fecha_apertura, :cod_expediente], documentos: [:nombre, :fecha_documento]]
             }

  def initialize

  end

  def get_document
    @operation = :get_ws
#   @params = @params.merge(criteria(criteria))
    valid?
    @response_data = arche_client.call_operation(@operation, @params)
    @response_data = @response_data.to_hash[@response_data.to_hash.keys[0]][:return] if @response_data.class.to_s == 'Savon::Multipart::Response'
  end

  def new_document
    @operation = :new_ws
    valid?
    @response_data = arche_client.call_operation(@operation, @params)
    @response_data = @response_data.to_hash[@response_data.to_hash.keys[0]][:return] if @response_data.class.to_s == 'Savon::Multipart::Response'
  end

  def valid?
    # TODO validate required elements for operation REQUIRED[operation]
    case @operation
     when :get_ws
       @params[:criterio].present?
     when :new_ws
       true
     else
      true
    end
  end

  # getters - getWs response
  def id
    objects[:identificador]
  end

# file data
  def file_name
    objects[:nombre]
  end

  def file_extension
    objects[:extension]
  end

  def file_bin
    objects[:fichero]
  end

# attributes

  def name
    attribute("name")
  end

  def creation_date
    attribute("r_creation_date")
  end

  def csv
    attribute("csv")
  end

  def title
    attribute("title")
  end

  def access_date
    attribute("r_access_date")
  end

  def content_type
    attribute("a_content_type")
  end

  def date
    attribute("fecha_documento")
  end

  def signed
    attribute("a_is_signed")
  end

  def name
    attribute("object_name")
  end

  def size
    attribute("r_content_size")
  end

  def version
    attribute("r_version_label")
  end

  def version_type
    attribute("r_version_label")
  end

  def modify_date
    attribute("r_modify_date")
  end

  def trading_year
    attribute("ejercicio")
  end

  def code
    attribute("cod_expediente")
  end

  def sicia_number
    attribute("cod_expediente").split('_').last
  end

  def society_id
    attribute("cod_expediente").split('_').first
  end

  def add_criterion(key, value)
    @params[:criterio] = {} unless @params[:criterio].present?
    criterion = {clave: key, valores: value}
    @params[:criterio] = @params[:criterio].present? ? @params[:criterio].push(criterion) : @params[:criterio] = [criterion]
  end

  # Add request elements
  def add_property(element=nil, key, value)
    property= {key.to_sym=> value}
    @params = {} unless @params.present?
    if element.present?
      @params[element] = {} unless @params[element].present?
      @params[element] = @params[element].merge(property)
    else
      @params = @params.merge(property)
    end
  end

  def add_attribute(element=nil, key, value)
    attribute = {clave: key, valores: value}
    @params = {} unless @params.present?
    if element.present?
      @params[element][:atributos]= [] unless @params[element][:atributos].present?
      @params[element][:atributos].push(attribute)
    else
      @params[:atributos] = @params[:atributos].merge(attr)
    end
  end

  def add_folder_property(key, value)
    add_property(:expediente, key, value)
  end

  def add_folder_attribute(key, value)
    add_attribute(:expediente, key, value)
  end

  def add_document_property(key, value)
    add_property(:documentos, key, value)
  end

  def add_document_attribute(key, value)
    add_attribute(:documentos, key, value)
  end

  def parameters
    @params
  end

  def result
    @response_data[:resultado]
  end

  def error?
    @response_data[:error].present?
  end

  def error_message
    @response_data[:message] if @response_data[:error].present?
  end


  private

  def objects
    @response_data[:objetos]
  end

  def attributes
    objects[:atributos]
  end

  def attribute(clave)
    attributes.each do |att|
      return att[:valores] if att[:clave] == clave
    end
  end

  def arche_client
    @arche  ||= ArcheApi.new
  end

end