require('rspec')
require('contact')

describe(Contact) do
  describe('#first_name') do
    it("will return a contact's first name") do
      new_contact = Contact.new({ :first_name => "johnny", :last_name => "cash", :birth_month => "december" })
      expect(new_contact.first_name()).to(eq("johnny"))
    end
  end

  describe('#last_name') do
    it("will return a contact's last name") do
      new_contact = Contact.new({ :first_name => "johnny", :last_name => "cash", :birth_month => "december" })
      expect(new_contact.last_name()).to(eq("cash"))
    end
  end

  describe('#birth_month') do
    it("will return a contact's birth month") do
      new_contact = Contact.new({ :first_name => "johnny", :last_name => "cash", :birth_month => "december" })
      expect(new_contact.birth_month()).to(eq("december"))
    end
  end

end
