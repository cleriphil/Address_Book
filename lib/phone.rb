class Phone
  attr_reader(:area_code, :phone_number, :type, :id)
  @@phone_list = []

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
    @id = @@phone_list.length().+(1)
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

  define_singleton_method(:find) do |identification|
    found_phone = nil
    @@phone_list.each() do |phone|
      if phone.id().eql?(identification)
        found_phone = phone
      end
    end
  found_phone
  end

end
