require('rspec')
require('phone')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe('#area_code') do
    it("will return a contact's area code") do
      new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
      expect(new_number.area_code()).to(eq(503))
    end
  end

  describe('#phone_number') do
    it("will return a contact's phone number") do
      new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
      expect(new_number.phone_number()).to(eq(555-5555))
    end
  end

  describe('#type') do
    it("will return a contact's type") do
      new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
      expect(new_number.type()).to(eq("home"))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves the phone to the phone list") do
      new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
      new_number.save()
      expect(Phone.all()).to(eq([new_number]))
    end
  end
  describe('.clear') do
    it("empties the phone list") do
      new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
      new_number.save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end
  describe('#id') do
    it("returns the id of the phone") do
    new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
    new_number.save()
    expect(new_number.id()).to(eq(1))
    end
  end
  describe('.find') do
    it("finds the phone by its id") do
      new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
      new_number.save()
      new_number2 = Phone.new({ :area_code => 215, :phone_number => 555-5554, :type => "cell"})
      new_number2.save()
      expect(Phone.find(new_number.id())).to(eq(new_number))
    end
  end

end
