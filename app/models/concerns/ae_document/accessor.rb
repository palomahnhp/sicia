module AeDocument::Accessor
  extend ActiveSupport::Concern

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
    attribute("r_version_TYPE")
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

  def check_params
    @params = {} unless @params.present?
  end

  def check_element(element)
    @params[element] = {} unless @params[element].present?
  end

  def check_attribute(element)
    @params[element][:atributos]= [] unless @params[element][:atributos].present?
  end

end