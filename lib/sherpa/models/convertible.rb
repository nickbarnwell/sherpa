module Sherpa::Convertible
  attr_accessor :external_id, :bc_attrs
  alias :attrs :bc_attrs
  class <<
    def type
      @type = "MUST BE SET"
    end
  end

  def initialize(bc_obj)
    @bc_attrs = bc_obj.attributes.inject({}) do |hash, (key, value)|
      hash[key.gsub('-', '_').to_sym] = value
      hash
    end
    @external_id = @bc_attrs[:id]
  end

  def podio_fields
    raise Exception.new(
    'You must override this with the fields to be included
     in the  Podio object'
    )
  end

  def to_podio
    {external_id: @bc_attrs[:id], fields: podio_fields}
  end
end
