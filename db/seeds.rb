u = User.new
u.email = 'admin@test.com'
u.password = '111111'
u.password_confirmation = '111111'
u.is_admin = true
u.save

products = [{ categories: '公路车',
              title: 'Emonda ALR 5',
              description: 'TREK/崔克 Emonda ALR 5 ALPHA铝合金轻量公路自行车' },

            { categories: '公路车',
              title: 'Emonda SL 6',
              description: 'TREK/崔克 Emonda SL 6 OCLV碳纤维轻量公路自行车' },

            { categories: '公路车',
              title: 'FX 3',
              description: 'TREK/崔克 FX 3 铝合金城市通勤健身自行车' },

            { categories: '公路车',
              title: 'Madone 9.2',
              description: 'TREK/崔克 Madone 9.2 OCLV碳纤维超级公路自行车' },

            { categories: '山地车',
              title: 'Reign SX',
              description: 'GIANT捷安特Reign SX软尾山地车6.7“MAESTRO避震系统越野AM' },

            { categories: '山地车',
              title: 'ATX735',
              description: 'GIANTt捷安特ATX735山地车27速油碟' },

            { categories: '山地车',
              title: 'XTC 777',
              description: 'GIANT捷安特XTC 777 30速油压碟刹山地车' },

            { categories: '山地车',
              title: 'Expedition 2',
              description: 'GIANT捷安特Expedition 2征途27.5旅行山地车27速带线控锁死前叉' }]

p1 = Product.create([categories: products[0][:categories], title: products[0][:title], description: products[0][:description], quantity: 20, price: 9580])
p1 = Product.create([categories: products[1][:categories], title: products[1][:title], description: products[1][:description], quantity: 10, price: 21_800])
p3 = Product.create([categories: products[2][:categories], title: products[2][:title], description: products[2][:description], quantity: 15, price: 4980])
p4 = Product.create([categories: products[3][:categories], title: products[3][:title], description: products[3][:description], quantity: 10, price: 36_800])
p5 = Product.create([categories: products[4][:categories], title: products[4][:title], description: products[4][:description], quantity: 19, price: 12_800])
p6 = Product.create([categories: products[5][:categories], title: products[5][:title], description: products[5][:description], quantity: 19, price: 2098])
p7 = Product.create([categories: products[6][:categories], title: products[6][:title], description: products[6][:description], quantity: 19, price: 4998])
p8 = Product.create([categories: products[7][:categories], title: products[7][:title], description: products[7][:description], quantity: 19, price: 3498])
puts 'create products'
