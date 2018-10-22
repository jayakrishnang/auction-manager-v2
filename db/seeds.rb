Role.find_or_create_by(name: 'admin')
Role.find_or_create_by(name: 'user')
Role.find_or_create_by(name: 'team_owner')

seed_file = Rails.root.join('db', 'seeds', 'users.yml')
users = YAML::load_file(seed_file)
users.each do |user|
  user['email'] = "#{user['name']}@rubyians.com".gsub(' ', '').downcase
  u = User.create(user)
  UsersRole.create(role_id: 2, user_id: u.id)
end
