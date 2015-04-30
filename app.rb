require('sinatra')
require('sinatra/reloader')
require('./lib/phone')
require('./lib/contact')
also_reload('lib/**/*.rb')

get('/')do
  erb(:index)
end

get('/contacts/new') do
  erb(:contact_form)
end


post('/contacts') do
  @first_name = params.fetch('first_name')
  @last_name = params.fetch('last_name')
  @birth_month = params.fetch('birth_month')
  new_contact = Contact.new({ :first_name => @first_name, :last_name => @last_name, :birth_month => @birth_month })
  new_contact.save()
  erb(:success)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @phones = @contact.phones()
  erb(:contact)
end

get('/contacts/:id/phones/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_form)
end

post('/phones') do
  area_code = params.fetch('area_code')
  phone_number = params.fetch('phone_number')
  type = params.fetch('type')
  @phone = Phone.new({ :area_code => area_code, :phone_number => phone_number, :type => type })
  @phone.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_phone(@phone)
  erb(:success)
end
