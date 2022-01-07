require 'bcrypt'

# generate hash 
password_hash = BCrypt::Password.create("blabla")
password_hash2 = BCrypt::Password.create("abcd1234")

puts "Welcome to the authenticator"
25.times {print "-"}
puts
puts "This is program will take input from the user and compare password"
puts

users = [
          { username: "ruby", password: password_hash },
          { username: "ruby2", password: password_hash2 }
        ]

def authenticate_user(username, password, users)
  users.each do |user| 
    return user if user[:username] == username && user[:password] == password
  end
  "Credentials were not correct"
end

def get_credentials
  print "Username: "
  username = gets.chomp.downcase
  print "Password: "
  password = gets.chomp.downcase
  return username, password
end

continue = ""
3.times do 
  username, password = get_credentials
  puts
  puts authenticate_user(username, password, users)
  print "Press n to quit or any other key to continue: "
  puts
  continue = gets.chomp.downcase  
  break if continue == "n" 
end
puts "You have exceeded the number of attempts!" if continue != "n"