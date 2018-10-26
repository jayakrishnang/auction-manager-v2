# Create roles
admin_role 				= Role.find_or_create_by(name: 'admin')
player_role 			= Role.find_or_create_by(name: 'player')
team_owner_role 	= Role.find_or_create_by(name: 'team_owner')

# create admin user
admin_user = User.create(name: 'Admin', email: 'admin@auctionmanager.com',
                         password: 'admin123', password_confirmation: 'admin123')
UsersRole.create(role_id: admin_role.id, user_id: admin_user.id)

seed_file = Rails.root.join('db', 'seeds', 'users.yml')
users = YAML::load_file(seed_file)
users.each do |user|
  user['email'] = "#{user['name']}@rubyians.com".gsub(' ', '').downcase
  u = User.create(user)
  UsersRole.create(role_id: 2, user_id: u.id)
end
