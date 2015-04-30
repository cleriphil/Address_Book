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

    describe('.clear') do
      it("empties the phone list") do
        new_number = Phone.new({ :area_code => 503, :phone_number => 555-5555, :type => "home"})
        new_number.save()
        Phone.clear()
        expect(Phone.all()).to(eq([]))
      end
    end
  end


end
