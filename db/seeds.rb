Level.find_or_create_by!(name: 'Nível 1', required_score: 0)

user = User.find_or_create_by(email: 'bogus@screenca.st') do |u|
  u.password = 'screenc4st'
end

10.times do
  id = SecureRandom.hex[0..9]

  Cast.create(
    user: user,
    name: "Cast: #{id}",
    url: "http://screenca.st/watch?v=#{id} ",
    description: "Screencast #{id}, recorded at #{DateTime.current}"
  )
end

