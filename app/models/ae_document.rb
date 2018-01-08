class AeDocument

  attr_accessor :operation, :response_data

  TYPE = {document: :ayto_d_archivo, folder: :ayto_f_archivo, work_folder: :dm_folder}

  def initialize()

  end

  def get_document(criteria, type=0)
    return false unless criteria.present?
    @operation = :get_ws
    @params = {operacion: type}
    @params = @params.merge(criteria(criteria))
    arche   = ArcheApi.new
    @response_data = arche.call_operation(@operation, @params)
    @response_data = @response_data.to_hash[@response_data.to_hash.keys[0]][:return]
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

  def new_document
    @operation = ':newWS'
  end

  def result
    @response_data[:resultado]
  end


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

end