u = User.new
u.email = "admin@test.com"
u.password = "111111"
u.password_confirmation = "111111"
u.is_admin = true
u.save
