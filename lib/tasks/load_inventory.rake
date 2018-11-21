require 'faker'

namespace :load_inventory do

  task first: :environment do
    Inventory.delete_all

    200.times do
      make = Make.order("RANDOM()").first.id
      model = Model.where("make_id = "+make).order("RANDOM()").first.id

      Inventory.create(make_id: make, model_id: model, miles: Faker::Vehicle.mileage,
                       vin: Faker::Vehicle.vin, color_id: Color.all.order("RANDOM()").first.id, year: Faker::Vehicle.year)
    end
  end

  task second: :environment do

  end

  task third: :environment do

  end

end
