class AeDocument

  attr_accessor :operation, :response_data

  TYPE = {document: :ayto_d_archivo, folder: :ayto_f_archivo, work_folder: :dm_folder}
  OPERATION = {normal: 0, eni: 1, metadata: 0, file:1, file_sign: 1, file_eni: 2, validation_eni:3}

  def initialize()

  end

  def get_document(criteria)
    return false unless criteria.present?
    @operation = :get_ws
#    @params = @params.merge(criteria(criteria))
    add_property(criteria(criteria))
    @response_data = arche_client.call_operation(@operation, @params)
    @response_data = @response_data.to_hash[@response_data.to_hash.keys[0]][:return]
  end

  def new_document
    @operation = :new_ws
    @response_data = arche_client.call_operation(@operation, @params)
    @response_data = @response_data.to_hash[@response_data.to_hash.keys[0]][:return] if @response_data.present?
  end

  # setters - news
  def add_operation(param=nil)
    if param==nil
      {property: 'operacion', error: true, message: 'Parámetro obligatorio'}
    else
      add_property(operacion: param)
    end
  end

  def add_folder_operation(param=nil )
    if param==nil
      {property: 'expediente:operacion', error: true, message: 'Parámetro obligatorio'}
    else
      add_folder_property({operacion: param})
    end
  end

  def add_folder_type(param=nil)
    if param==nil
      {property: 'expediente:tipo', error: true, message: 'Parámetro obligatorio'}
    else
      add_folder_property({tipo: 'ayto_f_archivo'})
    end
  end

  def add_folder_name(param=nil )
    if param==nil
      {property: 'expediente:nombre', error: true, message: 'Parámetro obligatorio'}
    else
      add_folder_property({nombre: param})
    end
  end


  def add_folder_open_date(param=nil)
    if param==nil
      {property: 'expediente:fecha_apertura', error: true, message: 'Parámetro obligatorio'}
    else
      add_folder_attribute(fecha_apertura: param)
    end
  end

  def add_folder_cod_folder(param=nil)
    if param==nil
      {property: 'expediente:cod_expediente', error: true, message: 'Parámetro obligatorio'}
    else
      add_folder_attribute(cod_expediente: param)
    end
  end

  def add_document_name(param=nil)
    if param==nil
      {property: 'documento:nombre', error: true, message: 'Parámetro obligatorio'}
    else
      add_document_property(nombre: param)
    end

  end

  def add_document_operation(param=nil)
    if param==nil
      {property: 'documento:operacion', error: true, message: 'Parámetro obligatorio'}
    else
      add_document_property(operacion: param)
    end
  end

  def add_document_type(param=nil)
    add_document_property(tipo: param) unless param==nil
  end

  def add_document_extension(param=nil)
    add_document_property(extension: param) unless param==nil
  end

  def add_document_file_b64(param=nil)
    add_document_property(fichero: param) unless param==nil
  end

  def add_document_path(param=nil)
    add_document_property(rutaFicher: param) unless param==nil
  end

  def add_document_date(param=nil)
    add_document_attribute(fecha_documento: param) unless param==nil
  end

  def add_document_title(param=nil)
    add_document_attribute(title: param) unless param==nil
  end

  # getters - getWs response
  def id
    attribute('identificador')
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

  def add_property(param)
    @params = {} unless @params.present?
    @params = @params.merge(param)
  end


  def add_folder_property(param)
    @params = {} unless @params.present?
    @params[:expediente] = {} unless @params[:expediente].present?
    @params[:expediente] = @params[:expediente].merge(param)
  end

  def add_folder_attribute(param)
    @params = {} unless @params.present?
    @params[:expediente] = {} unless @params[:expediente].present?
    @params[:expediente][:atributos] = {} unless @params[:expediente][:atributos].present?
    @params[:expediente][:atributos] = @params[:expediente][:atributos].merge(param)
  end

  def add_document_property(param)
    @params = {} unless @params.present?
    @params[:documentos] = {} unless @params[:documentos].present?
    @params[:documentos] = @params[:documentos].merge(param)
  end

  def add_document_attribute(param)
    @params = {} unless @params.present?
    @params[:documentos] = {} unless @params[:documentos].present?
    @params[:documentos][:atributos] = {} unless @params[:documentos][:atributos].present?
    @params[:documentos][:atributos] = @params[:documentos][:atributos].merge(param)
  end

  def result
    @response_data[:resultado]
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

  def criteria(criteria)
    params = {criterio: {}}
    criteria_array = []
    criteria.each do |criterion|
      criteria_array.push({clave: criterion[0], valores: criterion[1]})
    end
    params[:criterio] = criteria_array
    params
  end

  def arche_client
    @arche  ||= ArcheApi.new
  end
end