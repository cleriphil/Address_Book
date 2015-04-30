class Phone
  attr_reader(:area_code, :phone_number, :type)
  @@phone_list = []

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
  end


  define_singleton_method(:all) do
    @@phone_list
  end

  define_method(:save) do
    @@phone_list.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_list = []
  end



end
