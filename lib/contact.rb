class Contact
  attr_reader(:first_name, :last_name, :birth_month)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birth_month = attributes.fetch(:birth_month)
  end

end
