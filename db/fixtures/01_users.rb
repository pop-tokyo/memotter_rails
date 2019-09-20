User.seed do |s|
  s.email = 'me@example.com'
  s.password = 'password'
  s.username = 'sample-1'
end

User.seed do |s|
  s.email = 'you@example.com'
  s.password = 'password'
  s.username = 'sample-2'
end

User.seed do |s|
  s.email = 'another@example.com'
  s.password = 'password'
  s.username = 'sample-3'
end

