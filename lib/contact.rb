class Contact
  attr_reader(:first_name, :last_name, :birth_month, :id, :phones)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birth_month = attributes.fetch(:birth_month)
    @id = @@contacts.length.+(1)
    @phones = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(identification.to_i())
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_phone) do |new_phone|
    @phones.push(new_phone)
  end



end
