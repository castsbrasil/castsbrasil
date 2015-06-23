Level.find_or_create_by!(name: 'Nível 1', required_score: 0)

user = User.find_or_create_by(email: 'bogus@screenca.st') do |u|
  u.password = 'screenc4st'
end

user.create_profile(first_name: "Seed", last_name: "User")

videos = %w(IgbHzFb1hGw _N7hQOi9Zww QUV1k134YB4 zCXDzpbq484 rZW0MNcj_N4 nzUrTVvNFcw dem6OQaUliA 0MueQ1GmaGs OygzzSv-fB4)

videos.each do |video|
  id = SecureRandom.hex[0..9]

  Cast.create(
    user: user,
    name: "Cast: #{video}",
    url: "https://www.youtube.com/watch?v=#{video} ",
    description: "Screencast #{video}, recorded at #{DateTime.current}"
  )
end

