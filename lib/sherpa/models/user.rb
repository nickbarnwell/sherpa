class Sherpa::User
  include Sherpa::Convertible

  def type
    :User
  end

  def initalize(bc_obj)
    super
  end

  def podio_fields
    [
      Sherpa::PodioField.new(:text, :name, "#{attrs[:first_name]} #{attrs[:last_name]}"),
      Sherpa::PodioField.new(:text, :mail, attrs[:email_address])
    ].map(&:field)
  end
end