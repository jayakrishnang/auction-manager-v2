Role.find_or_create_by(name: 'admin')
Role.find_or_create_by(name: 'player')
Role.find_or_create_by(name: 'team_owner')

admin_user = User.find_or_create_by(name:'Admin', email:'admin@auctionmanager.com', password:'admin123', password_confirmation:'admin123')
UsersRole.find_or_create_by(role_id: 1, user_id: admin_user.id)

seed_file = Rails.root.join('db', 'seeds', 'users.yml')
users = YAML::load_file(seed_file)
users.each do |user|
  user['email'] = "#{user['name']}@rubyians.com".gsub(' ', '').downcase
  u = User.find_or_create_by(user)
  UsersRole.find_or_create_by(role_id: 2, user_id: u.id)
end
