require('rspec')
require('contact')
require('phone')

describe(Contact) do
  before() do
    Contact.clear()
  end
  
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

  describe('.all') do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a contact to the array of all contacts") do
      new_contact = Contact.new({ :first_name => "johnny", :last_name => "cash", :birth_month => "december" })
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end

  describe('.clear') do
    it("clears the array of all contacts") do
      new_contact = Contact.new({ :first_name => "johnny", :last_name => "cash", :birth_month => "december" })
      new_contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

end
