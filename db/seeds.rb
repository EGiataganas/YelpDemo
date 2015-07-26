def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

Restaurant.delete_all

restaurant = Restaurant.create!([{name: 'Restaurant 1', address: '350 Fith Avenue, New York, NY 10118', phone: '(123) 456-7890', website: 'http://www.sample.foo', image: seed_image('restaurant')},
                     {name: 'Restaurant 2', address: '350 Fith Avenue, New York, NY 10118', phone: '(123) 456-7890', website: 'http://www.sample.foo', image: seed_image('restaurant')},
                     {name: 'Restaurant 3', address: '350 Fith Avenue, New York, NY 10118', phone: '(123) 456-7890', website: 'http://www.sample.foo', image: seed_image('restaurant')},
                     {name: 'Restaurant 4', address: '350 Fith Avenue, New York, NY 10118', phone: '(123) 456-7890', website: 'http://www.sample.foo', image: seed_image('restaurant')}])