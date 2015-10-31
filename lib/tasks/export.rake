namespace :export do
  desc "Prints User.all in a seeds.rb way."
  task :seeds_format => :environment do
    User.order(:id).all.each do |user|
      if(user.username != nil)	
        puts "username: " + user.username
  	  end
    end
  end
end