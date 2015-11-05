namespace :export do
  desc "Prints User.all in a seeds.rb way."
  task :seeds_format => :environment do
    User.order(:id).all.each do |user|
      if(user.username != nil)	
        puts "username: " + user.username 
        puts "  email: " + user.email
        puts "  password: " + "test1234"
      else
    	puts "email: " + user.email
    	if(user.password!= nil)
    	puts "  password: " + user.password
    	end
      end
    end
  end
end