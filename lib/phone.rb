class Phone
  attr_reader(:area_code, :phone_number, :type)

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
  end

end
