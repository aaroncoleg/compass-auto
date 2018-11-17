require 'faker'

# Lookups
Role.create([{ name: 'User', level:  1},
             { name: 'Sales Person', level: 2 },
             { name: 'Sales Manager', level: 3 },
             { name: 'Finance Manager', level:  4},
             { name: 'Inventory Manager', level:  5}
            ])
owner = Role.create(name: 'Dealership Owner', level:  6)

Color.create([{name: 'Red'},
              {name: 'Black'},
              {name: 'Blue'},
              {name: 'Green'},
              {name: 'Brown'},
              {name: 'Yellow'},
              {name: 'Silver'}
             ])
State.create([
                 { :state_name => 'Alabama', :state_abbr => 'AL'}, { :state_name => 'Alaska', :state_abbr => 'AK'}, { :state_name => 'Arizona', :state_abbr => 'AZ'}, { :state_name => 'Arkansas', :state_abbr => 'AR'}, { :state_name => 'California', :state_abbr => 'CA'}, { :state_name => 'Colorado', :state_abbr => 'CO'},
                 { :state_name => 'Connecticut', :state_abbr => 'CT'}, { :state_name => 'Delaware', :state_abbr => 'DE'}, { :state_name => 'District of Columbia', :state_abbr => 'DC'}, { :state_name => 'Florida', :state_abbr => 'FL'},
                 { :state_name => 'Georgia', :state_abbr => 'GA'}, { :state_name => 'Hawaii', :state_abbr => 'HI'}, { :state_name => 'Idaho', :state_abbr => 'ID'}, { :state_name => 'Illinois', :state_abbr => 'IL'}, { :state_name => 'Indiana', :state_abbr => 'IN'}, { :state_name => 'Iowa', :state_abbr => 'IA'}, { :state_name => 'Kansas', :state_abbr => 'KS'},
                 { :state_name => 'Kentucky', :state_abbr => 'KY'}, { :state_name => 'Louisiana', :state_abbr => 'LA'}, { :state_name => 'Maine', :state_abbr => 'ME'}, { :state_name => 'Maryland', :state_abbr => 'MD'}, { :state_name => 'Massachusetts', :state_abbr => 'MA'}, { :state_name => 'Michigan', :state_abbr => 'MI'}, { :state_name => 'Minnesota', :state_abbr => 'MN'},
                 { :state_name => 'Mississippi', :state_abbr => 'MS'}, { :state_name => 'Missouri', :state_abbr => 'MO'}, { :state_name => 'Montana', :state_abbr => 'MT'}, { :state_name => 'Nebraska', :state_abbr => 'NE'},
                 { :state_name => 'Nevada', :state_abbr => 'NV'}, { :state_name => 'New Hampshire', :state_abbr => 'NH'}, { :state_name => 'New Jersey', :state_abbr => 'NJ'}, { :state_name => 'New Mexico', :state_abbr => 'NM'},
                 { :state_name => 'New York', :state_abbr => 'NY'}, { :state_name => 'North Carolina', :state_abbr => 'NC'}, { :state_name => 'North Dakota', :state_abbr => 'ND'}, { :state_name => 'Ohio', :state_abbr => 'OH'}, { :state_name => 'Oklahoma', :state_abbr => 'OK'}, { :state_name => 'Oregon', :state_abbr => 'OR'},
                 { :state_name => 'Pennsylvania', :state_abbr => 'PA'}, { :state_name => 'Rhode Island', :state_abbr => 'RI'}, { :state_name => 'South Carolina', :state_abbr => 'SC'}, { :state_name => 'South Dakota', :state_abbr => 'SD'}, { :state_name => 'Tennessee', :state_abbr => 'TN'}, { :state_name => 'Texas', :state_abbr => 'TX'}, { :state_name => 'Utah', :state_abbr => 'UT'},
                 { :state_name => 'Vermont', :state_abbr => 'VT'}, { :state_name => 'Virginia', :state_abbr => 'VA'}, { :state_name => 'Washington', :state_abbr => 'WA'}, { :state_name => 'West Virginia', :state_abbr => 'WV'}, { :state_name => 'Wisconsin', :state_abbr => 'WI'}, { :state_name => 'Wyoming', :state_abbr => 'WY'}
             ])

# Make and Model
50.times do
make_and_model =Faker::Vehicle.unique.model
make_name = make_and_model.split(' ').first
model_name = make_and_model.split(' ').second

make = Make.create(name: make_name)
Model.create(name: model_name, maked_id: make.id)
end


#Sample Data
User.create([{first_name: 'Johnny', last_name: 'Smith', email:'default@gmail.com', password: 'default', role_id: owner.id}])

#Customers
50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Customer.create(last_name: last_name, first_name: first_name, street_address: Faker::Address.street_address, city: Faker::Address.city,
                  state_id: Random.rand(State.count), zip_code: Faker::Base.numerify('#####'),
                  phone_number: Faker::Base.numerify('(###) ###-####'), email: Faker::Internet.email(first_name))
end
